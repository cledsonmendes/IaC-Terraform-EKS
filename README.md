# IaC-Terraform-EKS

> Status do projeto: Concluído.

O Amazon EKS é um serviço gerenciado do Kubernetes para executar o Kubernetes na Nuvem AWS e em datacenters on-premises. Na nuvem, o Amazon EKS gerencia automaticamente a disponibilidade e a escalabilidade dos nós do ambiente de gerenciamento do Kubernetes, que são responsáveis por programar contêineres, gerenciar a disponibilidade das aplicações, armazenar dados de cluster e outras tarefas principais. Com o Amazon EKS, você pode aproveitar toda a performance, escalabilidade, confiabilidade e disponibilidade da infraestrutura da AWS, bem como integrações com serviços de rede e segurança da AWS. On-premises, o EKS fornece uma solução Kubernetes consistente e totalmente compatível com ferramentas integradas e implantação simples em AWS Outposts, máquinas virtuais ou servidores bare metal. Fonte: AWS


Para rodar esse projeto na sua maquina, você precisa ter o terraform instalado e uma conta na AWS.

Instalação do Terraform.
```
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
```

Criar conta na AWS.
```
https://aws.amazon.com/
```

Feito isso você precisa entrar na pasta env/prod/ e rodar:

> terraform init

> terraform apply (check todas as alterações e digite yes)

Para destruir a infraestrututa criada digite:

> terraform destroy

Obrigado pelo acesso.
