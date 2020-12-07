# Sobre o MRSystemB
Estes documento README tem como objetivo fornecer as informações necessárias para o setup dos projetos.
**Obs.: Eu decidi deixar os projetos todos juntos para facilitar a visualização na hora da avaliação dos mesmos**

# 🔗 Links

***Obs. Seção links dos sites oficiais para setup dos projetos:

- Documentação Nodejs 
  - https://nodejs.org/en/download/package-manager/
  
- Documentação Flutter
  - https://flutter.dev/docs/get-started/install

- Documentação Postgresql
  - https://www.postgresql.org/download/

# 🏗 Projeto 1: system_api ?

- O backend foi desenvolvido utilizando o **Node.JS**, para a instalação é bem simples:

Você deve realizar um fork deste repositório e, ao finalizar, enviar o link do seu repositório para a nossa equipe. Lembre-se, NÃO é necessário criar um Pull Request para isso, nós iremos avaliar e retornar por email o resultado do seu teste.

**Obs. existe um arquivo chamado env.example, este arquivo deve ser editado para .env**

dados para aplicação do arquivo .env: 
- PORT=**8000** --> porta utilizada para este projeto
- HOST=**localhost** --> valor padrão para ambiente desenvolvimento local
- TOKEN_SECRET=Inserir qualquer valor

**Configuração**
- 1. Na seção acima **links** encontra-se o site oficial para baixar o pacote para o Sistema Operacional adequado.
- 2. Para certificar da instalação do Node.JS rode o comando no terminal **node --version**, caso aparecer a versão, então tudo está funcionando corretamente.
- 3. Agora navegue até o projeto e rode o comando **npm install** 
- 4. Por fim, rode o comando **npm start**
- 5. Aplicação estará rodando na porta **8000**

**Banco de dados relacional**
Para armazenar os dados, escolhi o **postgresql**
- 1. Configuração: O link encontra-se na Seção **links** acima
- 2. Caso tenha configurado tudo por padrão: 
- 3. Exemplo de como os valores devem está no arquivo .env dos seguintes atributos: 
  - DB_DIALECT=**postgres** --> este valor é padrão
  - DB_NAME=Aqui é o nome do banco de dados, que pode ser criado abrindo seu SGBD
  - DB_USER=**postgres** --> este usuário é padrão, caso não for alterado
  - DB_PASS=Senha na hora da instalação do postgres
  - DB_LOGGING=**false** --> valor padrão
  - DB_POOL_MAX=**5** --> valor padrão
  - DB_POOL_MIN=**0** --> valor padrão
  - DB_POOL_ACQUIRE=**30000** --> valor padrão
  - DB_POOL_IDLE=**10000** --> valor padrão
# 🏗 Projeto 2: system_mobile ?

- O aplicativo que consumirá a API acima, foi desenvolvido utilizando o framework **FLUTTER**, o qual permite desenvolver aplicações tanto para ANDROID como IOS ( sendo multiplataforma ).

**Configuração**
- 1. Acima encontra-se o site oficial para baixar o SDK do flutter e alguns passos detalhados da configuração
- 2. Para certificar da flutter, rode o comando **flutter --version**, caso apareça as informações, está instalado corretamente
- 3. Para certificar que todos os requisitos do flutter estão configurados, rode o comando **flutter doctor -v**, 
a interface é interativa e caso esteja algo fora do normal, será mostrada a solução.
- 4. Navegue até o projeto e abra com seu editor.
- 5. Como é utilizado um emulador ou um dispositivo externo ( como o smartphone ), é necessário alterar a **rota** no arquivo:
  - 5.1. Caminho do arquivo: **system-mobile/lib/services/auth_service.dart**
  - 5.2. Atributo a ser editado: **_path**, valor que está no atributo: **http://10.0.0.248:8000/auth**
  - 5.3. Alterar apenas o valor do IP: **http://10.0.0.248** para o IP da sua rede local 
  - 5.4. Ao final de tudo, o resultado deve ser: **http://meu_ip_local:8000/auth**
- 6. Agora rode o comando **flutter run**

# 🖥 O que foi desenvolvido?

Conforme solicitado via documentado do desafio foi desenvolvido a seguinte feature: 

- BACKEND
  - Usuário
    - Cadastro de conta: dados da conta + endereço
  
- MOBILE
  - Screen Welcome 
    - Esta tela inicial foi desenvolvida para simular uma navegação completa de um usuário no projeto desenvolvido, sendo ela o ponto de partida do sistema.
  - Screen Login
    - Esta tela foi desenvolvida para simular uma autenticação, embora não solicitado via desafio, mas está apenas para deixar uma navegação completa.
  - Screen Signup
    - Esta tela foi desenvolvida conforme solicitado via desafio, com ela é possível a interação do usuário para se cadastrar ao sistema, possui validação e consulta CEP e ao final o registro da conta junto ao sistema.  