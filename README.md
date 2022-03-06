# Terraform_AWS_ApiGatewayV2_Lambda 

### Como executar o projeto:  
-> Digite no terminal(na Pasta raiz do projeto) o comando "terraform init" para baixar os providers utilizados utilizados no projeto.  
-> Digite no terminal(na Pasta raiz do projeto) "terraform plan" para ver o plano de execução que o terraform fará para criar os recursos do seu projeto.  
-> Digite no terminal(na Pasta raiz do projeto) "terraform apply" para aplicar os scripts do terraform e digite "yes" para prosseguir com o comando.  

### Descrição do projeto:  
Esse projeto utiliza scripts Terraform para provisionamento da infraestrutura. Esses scripts vão realizar o provisionamento dos seguintes recursos:  
-> Um Lambda, com uma aplicação "echo server" (que também deve ser deployada pelo Terraform).  
-> Um API Gateway.  

### Requisitos de software e bibliotecas:  
-> Terraform e dependencias.    
-> Node. 

### Links úteis:  
Documentação do localStack sobre apigateway: https://docs.localstack.cloud/aws/apigatewayv2/  
Documentação do Terraform sobre apigateway: https://registry.terraform.io/providers/hashicorp/aws/latest/docs  
Projeto que usa Node para construir uma Lambda e varias anotações importantes sobre conceitos
do Lambda: https://github.com/PedroAraujoNogueira/AWS_Lambda_Node_ImageAnalisys  
Conceitos do Terraform: https://github.com/PedroAraujoNogueira/Terraform_Conceitos  
