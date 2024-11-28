##Visão Geral
Este script em PHP implementa funcionalidades para gerenciar eventos, inscrições, atividades, patrocinadores e geração de relatórios utilizando o banco de dados MySQL. Ele inclui métodos para manipular dados, criar triggers e procedimentos armazenados, além de exibir relatórios com informações úteis.

##Dependências
PHP: Versão 7.4 ou superior
MySQL
Extensão MySQLi habilitada no servidor PHP
Configuração da Conexão com o Banco de Dados
Os dados de conexão com o banco de dados estão configurados no início do script:

php

$dbserver = '127.0.0.1';  
$bdUsuario = 'rafael123';  
$bdSenha = '123456'; 
$db = 'rafael';  

Certifique-se de atualizar esses valores de acordo com suas credenciais antes de utilizar o script.

## Funções Implementadas
1. ### `NumeroParticipantes($conexao)`
Retorna os 10 eventos com mais participantes inscritos. Exibe o nome do evento e o número total de participantes.

2. ### `mediaparticipantes($conexao)`
Calcula a média de participantes por atividade para cada evento. Mostra o título da atividade, o evento associado e a média.

3. ### `maiorAtvminis($conexao, $data_inicio, $data_fim)`
Identifica o palestrante que ministrou mais atividades em um período específico.

4. ### `ParticipantesPresencaTotal($conexao, $evento_id)`
Lista os participantes que compareceram a todas as atividades de um evento específico.

5. ### `RankingPatrocinadores($conexao)`
Gera um ranking dos patrocinadores baseado no valor total de apoio fornecido.

6. ### `TotalCertificadosEPercentualConcluidos($conexao)`
Exibe o total de certificados emitidos e o percentual de atividades concluídas por evento.

7. ### `criarTrigger($conexao, $nomeTrigger)`
Cria uma trigger para atualizar o número de participantes totais em um evento após uma nova inscrição.

8. ### `criarProcedimento($conexao, $nomeProcedure)`
Define um procedimento armazenado para consolidar dados de participantes e certificados emitidos por evento.

9. ### `inserirInscricao($conexao, $participante_id, $evento_id, $data_inscricao, $status_pagamento, $forma_pagamento)`
Insere uma nova inscrição no banco de dados com validação prévia do evento.

10. ### `gerarRelatorio($conexao, $nomeProcedure)`
Executa um procedimento armazenado para gerar relatórios de participantes e certificados emitidos.

##Como Usar
Configuração Inicial
Atualize as credenciais de conexão com o banco de dados no arquivo conexao.php.

##Chamar as Funções
Inclua o arquivo conexao.php no seu código principal.
Utilize as funções conforme necessário.

Exemplo:

php

include 'conexao.php';

NumeroParticipantes($conexao);
Criar Triggers ou Procedimentos
Para criar triggers ou procedimentos armazenados, utilize as funções criarTrigger e criarProcedimento, informando os nomes desejados:

php

criarTrigger($conexao, 'AtualizaTotalParticipantes');
criarProcedimento($conexao, 'RelatorioConsolidado');
Geração de Relatórios
Para gerar relatórios, chame a função gerarRelatorio com o nome do procedimento armazenado:

php

gerarRelatorio($conexao, 'RelatorioConsolidado');