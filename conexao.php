<?php  

$dbserver = '127.0.0.1';  
$bdUsuario = 'rafael123';  
$bdSenha = '123456'; 
$db = 'rafael';  

$conexao = mysqli_connect($dbserver, $bdUsuario, $bdSenha, $db);  

if (mysqli_connect_errno()) {  
    echo "Problemas para conectar no banco. Favor verifique os dados.";  
    die();  
} else {  
    echo "Conexão estabelecida com sucesso.\n";  
}  

// Função para obter o número de participantes por evento  
function NumeroParticipantes($conexao) {  
    $sql = "  
    SELECT e.nome AS evento, COUNT(i.id) AS total_participantes  
    FROM eventos e  
    LEFT JOIN inscricoes i ON e.id = i.evento_id  
    GROUP BY e.id  
    ORDER BY total_participantes DESC  
    LIMIT 10";  

    $result = mysqli_query($conexao, $sql); // Usando mysqli_query  

    if ($result && mysqli_num_rows($result) > 0) {  
        echo "<h2>Eventos com mais participantes inscritos:</h2>\n";  
        while ($row = mysqli_fetch_assoc($result)) {  
            echo "Evento: " . htmlspecialchars($row['evento']) . "\n - Total de Participantes: " . htmlspecialchars($row['total_participantes']) . "\n";  
        }  
    } else {  
        echo "Nenhum evento encontrado.";  
    }  
}  

// função para media de particiapnetes
function mediaparticipantes($conexao){
    $sql = "  
    SELECT a.titulo AS atividade, e.nome AS evento, AVG(i.participante_id) AS media_participantes  
    FROM atividades a  
    JOIN eventos e ON a.evento_id = e.id  
    LEFT JOIN inscricoes i ON a.evento_id = i.evento_id  
    GROUP BY a.id  
    ORDER BY media_participantes DESC";  
    $result = mysqli_query($conexao, $sql);

    if ($result->num_rows > 0) {  
        echo "<h2>Atividades de um evento com média de participação:</h2>\n";  
        while ($row = $result->fetch_assoc()) {  
            echo "Atividade: " . $row['atividade'] . " - Evento: " . $row['evento'] . " - Média de Participantes: " . $row['media_participantes'] . "\n";  
        }  
    } else {  
        echo "Nenhuma atividade encontrada.";  
    }  
    
 
}
function maiorAtvminis($conexao, $data_inicio,$data_fim){
    $sql = "  
    SELECT p.nome AS palestrante, COUNT(pa.atividade_id) AS total_atividades  
    FROM palestrantes p  
    JOIN palestrantes_atividades pa ON p.id = pa.palestrante_id  
    JOIN atividades a ON pa.atividade_id = a.id  
    WHERE a.data BETWEEN '$data_inicio' AND '$data_fim'  
    GROUP BY p.id  
    ORDER BY total_atividades DESC  
    LIMIT 1"; // Limita a 1 palestrante com mais atividades 
    $result = mysqli_query($conexao, $sql); 

    if ($result->num_rows > 0) {  
        $row = $result->fetch_assoc();  
        echo "<h2>Palestrante com mais atividades ministradas:</h2>\n";  
        echo "Palestrante: " . $row['palestrante'] . " - Total de Atividades: " . $row['total_atividades']."\n";  
    } else {  
        echo "Nenhum palestrante encontrado.";  
    }  


}
function ParticipantesPresencaTotal($conexao, $evento_id) {  
    $sql = "  
    SELECT p.id, p.nome  
    FROM participantes p  
    JOIN inscricoes i ON p.id = i.participante_id  
    JOIN atividades a ON i.evento_id = a.evento_id  
    WHERE i.evento_id = $evento_id  
    GROUP BY p.id  
    HAVING COUNT(DISTINCT a.id) = (SELECT COUNT(*) FROM atividades WHERE evento_id = $evento_id)";  

    $result = mysqli_query($conexao, $sql);  

    if ($result && mysqli_num_rows($result) > 0) {  
        echo "<h2>Participantes que compareceram a todas as atividades:</h2> \n";  
        while ($row = mysqli_fetch_assoc($result)) {  
            echo "Participante: " . htmlspecialchars($row['nome']) . "\n";  
        }  
    } else {  
        echo "Nenhum participante encontrado que compareceu a todas as atividades.\n";  
    }  
}  
function RankingPatrocinadores($conexao) {  
    $sql = "  
    SELECT nome_empresa AS patrocinador, SUM(apoio) AS apoio  
    FROM patrocinadores  
    GROUP BY id, nome_empresa  
    ORDER BY apoio DESC"; 
    $result = mysqli_query($conexao, $sql);  

    if ($result && mysqli_num_rows($result) > 0) {  
        echo "<h2>Ranking de Patrocinadores por Valor Total:</h2> \n";  
        while ($row = mysqli_fetch_assoc($result)) {  
            echo "Patrocinador: " . htmlspecialchars($row['patrocinador']) . " - Total doações: R$" . number_format($row['apoio'], 2, ',', '.') . "\n";  
        }  
    } else {  
        echo "Nenhum patrocinador encontrado.";  
    }  
}  
function TotalCertificadosEPercentualConcluidos($conexao) {  
    $sql = "
    SELECT   
        e.nome AS evento,  
        COUNT(DISTINCT i.participante_id) AS total_participantes,  -- Contando participantes únicos
        COUNT(c.id) AS total_certificados,  
        (SUM(CASE WHEN c.status = 'concluída' THEN 1 ELSE 0 END) / NULLIF(COUNT(a.id), 0)) * 100 AS percentual_concluidos  
    FROM eventos e  
    LEFT JOIN atividades a ON e.id = a.evento_id  
    LEFT JOIN certificados c ON c.atividade_id = a.id  
    LEFT JOIN inscricoes i ON i.evento_id = e.id   -- Contabilizando as inscrições para o evento
    GROUP BY e.id;";

    $result = mysqli_query($conexao, $sql);  

    if ($result && mysqli_num_rows($result) > 0) {  
        echo "<h2>Total de Certificados e Percentual de Atividades Concluídas:</h2>\n";  
        while ($row = mysqli_fetch_assoc($result)) {  
            echo "Evento: " . htmlspecialchars($row['evento']) . " - Total de Certificados: " . $row['total_certificados'] . " - Percentual de Atividades Concluídas: " . number_format($row['percentual_concluidos'], 2) . "%\n";  
        }  
    } else {  
        echo "Nenhum dado encontrado.";  
    }  
}  

//trigger

function criarTrigger($conexao, $nomeTrigger) {
    // Valida o nome da trigger para evitar caracteres inválidos
    if (!preg_match('/^[a-zA-Z0-9_]+$/', $nomeTrigger)) {
        echo "Nome da trigger inválido.<br>";
        return;
    }

    // Definição da trigger
    $sql_trigger = "
    CREATE TRIGGER $nomeTrigger
    AFTER INSERT ON inscricoes
    FOR EACH ROW
    BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END;
    ";

    // Executa a consulta SQL
    if ($conexao->query($sql_trigger) === TRUE) {
        echo "Trigger '$nomeTrigger' criada com sucesso.<br>";
    } else {
        echo "Erro ao criar trigger: " . $conexao->error . "<br>";
    }
}

// Função para criar o procedimento armazenado  

function criarProcedimento($conexao, $nomeProcedure) {
    $sql_procedimento = "
        CREATE PROCEDURE ".$nomeProcedure."()
    BEGIN
        SELECT   
            e.nome AS evento,  
            COUNT(DISTINCT i.participante_id) AS total_participantes,  
            COUNT(c.id) AS total_certificados  
        FROM eventos e  
        LEFT JOIN inscricoes i ON e.id = i.evento_id  
        LEFT JOIN atividades a ON e.id = a.evento_id  
        LEFT JOIN certificados c ON a.id = c.atividade_id  
        GROUP BY e.id;  
    END;";
    

    if ($conexao->query($sql_procedimento) === TRUE) {
        echo "Procedimento armazenado 'RelatorioConsolidadoParticipantesCertificados' criado com sucesso.<br>";
    } else {
        echo "Erro ao criar procedimento armazenado: " . $conexao->error . "<br>";
    }
}




// Função para inserir uma inscrição  
function inserirInscricao($conexao, $participante_id, $evento_id, $data_inscricao, $status_pagamento, $forma_pagamento) {
    // Primeiro, verifique se o evento existe
    $sql_verifica_evento = "
    SELECT COUNT(*) AS count FROM eventos WHERE id = ?";
    $stmt_verifica = $conexao->prepare($sql_verifica_evento);
    
    if ($stmt_verifica) {
        $stmt_verifica->bind_param("i", $evento_id);  // Vincula o ID do evento
        $stmt_verifica->execute();
        $result = $stmt_verifica->get_result();
        
        // Verifica se o evento existe
        $row = $result->fetch_assoc();
        if ($row['count'] == 0) {
            echo "Erro: Evento não encontrado.<br>";
            return;
        }
        
        $stmt_verifica->close();
    } else {
        echo "Erro ao verificar evento: " . $conexao->error . "\n";
        return;
    }
    
    // Agora, insira a inscrição
    $sql_inserir_inscricao = "
    INSERT INTO inscricoes (participante_id, evento_id, data_inscricao, status_pagamento, forma_pagamento) 
                              VALUES (?, ?, ?, ?, ?)";
    $stmt = $conexao->prepare($sql_inserir_inscricao);
    
    if ($stmt) {
        $stmt->bind_param("iisss", $participante_id, $evento_id, $data_inscricao, $status_pagamento, $forma_pagamento);
        
        if ($stmt->execute()) {
            echo "Inscrição realizada com sucesso!\n";
        } else {
            echo "Erro ao realizar a inscrição: " . $stmt->error . "<br>";
        }
        $stmt->close();
    } else {
        echo "Erro ao preparar a consulta para inserir inscrição: " . $conexao->error . "<br>";
    }
}


// Função para gerar o relatório  
function gerarRelatorio($conexao,$nomeProcedure) {
    $sql = "CALL $nomeProcedure()";
    if ($result = $conexao->query($sql)) {
        // Verifica se há resultados
        if ($result->num_rows > 0) {
            echo "Relatório Consolidado de Participantes e Certificados:\n";
            echo str_pad("Evento", 30) . str_pad("Total de Participantes", 25) . str_pad("Total de Certificados", 20) . "\n";
            echo str_repeat("-", 75) . "\n";

            while ($row = $result->fetch_assoc()) {
                echo str_pad($row['evento'], 30) . str_pad($row['total_participantes'], 25) . str_pad($row['total_certificados'], 20) . "\n";
            }
        } else {
            echo "Nenhum dado encontrado para o relatório.\n";
        }

        $result->free();
    } else {
        echo "Erro ao gerar relatório: " . $conexao->error . "\n";
    }
}




// Criando Procedimento Armazenado


// Inserindo Inscrição (exemplo)



// Chama a função  
//NumeroParticipantes($conexao);  

?>