# Talos Proxmox Terraform

Este projeto utiliza o Terraform para automatizar a criação de um cluster Kubernetes com Talos Linux em um ambiente Proxmox VE.

## Pré-requisitos

Antes de começar, você precisará de:

1.  **Terraform:** Certifique-se de que o [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) esteja instalado em sua máquina.
2.  **Acesso ao Proxmox:** Acesso a um servidor Proxmox com um usuário e token de API configurados.
3.  **Imagem ISO do Talos:** A imagem ISO do Talos Linux deve estar disponível em um dos seus armazenamentos do Proxmox.

## Configuração

1.  **Clonar o Repositório:**
    ```bash
    git clone <URL_DO_SEU_REPOSITORIO>
    cd proxmox-talos/iac
    ```

2.  **Configurar o Provedor Proxmox:**
    Para se conectar à API do Proxmox, você pode exportar as seguintes variáveis de ambiente:

    ```bash
    export PM_API_TOKEN_ID="seu-usuario@pve!seu-token-id"
    export PM_API_TOKEN_SECRET="seu-token-secreto"
    ```
    > **Nota:** O uso de variáveis de ambiente para as credenciais é mais seguro do que armazená-las diretamente nos arquivos de configuração.

3.  **Personalizar as Variáveis:**
    O arquivo `terraform.tfvars.example` contém todas as variáveis que você pode personalizar. Para começar, renomeie ou copie este arquivo para `terraform.tfvars`:

    ```bash
    cp terraform.tfvars.example terraform.tfvars
    ```

    Em seguida, abra o arquivo `terraform.tfvars` e ajuste os valores conforme necessário. Descomente as linhas que deseja alterar e defina os valores de acordo com seu ambiente.

## Como Usar

Depois de concluir a configuração, execute os seguintes comandos no diretório `iac/`:

1.  **Inicializar o Terraform:**
    Este comando inicializa o diretório de trabalho e baixa o provedor Proxmox.
    ```bash
    terraform init
    ```

2.  **Planejar a Infraestrutura:**
    O Terraform criará um plano de execução para você revisar antes de aplicar as alterações.
    ```bash
    terraform plan
    ```

3.  **Aplicar as Alterações:**
    Este comando criará as máquinas virtuais no Proxmox.
    ```bash
    terraform apply
    ```

## Pós-Instalação: Configurando o Cluster Talos

Após a criação das máquinas virtuais com o Terraform, siga estes passos para configurar e inicializar o seu cluster Talos.

**Variáveis de Ambiente:**

Antes de executar os scripts, você precisa definir as seguintes variáveis de ambiente com os endereços IP das suas VMs. Você pode obter esses IPs da saída do comando `terraform apply`.

```bash
export CONTROL_PLANE_IP="<IP_DO_SEU_CONTROL_PLANE>"
export WORKER_IP="<IP_DO_SEU_WORKER>"
```

**Passos:**

1.  **Gerar Arquivos de Configuração do Talos:**
    Este script usa `talosctl` para gerar os arquivos de configuração necessários para o plano de controle e os nós de trabalho.

    ```bash
    ./01_generate_config.sh
    ```

2.  **(Opcional) Verificar Discos:**
    Antes de aplicar a configuração, você pode usar este script para verificar se o Talos consegue identificar o disco de instalação (`/dev/sda`).

    ```bash
    ./02_get_disks.sh
    ```

3.  **Aplicar Configuração ao Nó do Plano de Controle:**
    Este comando aplica o arquivo de configuração gerado ao seu nó do plano de controle, iniciando o processo de instalação.

    ```bash
    ./03_control_plane_node.sh
    ```

4.  **Aplicar Configuração ao Nó de Trabalho:**
    Faça o mesmo para o seu nó de trabalho. Se você tiver vários workers, execute este comando para cada um, atualizando a variável `WORKER_IP`.

    ```bash
    ./04_worker_node.sh
    ```

5.  **Finalizar e Usar o Cluster:**
    Este script finaliza a configuração, faz o bootstrap do etcd e configura o `kubeconfig` na sua máquina local para que você possa usar `kubectl` para interagir com o seu novo cluster.

    ```bash
    ./05_using_cluster.sh
    ```

Após executar todos os scripts, seu cluster Kubernetes estará pronto para ser usado!

4.  **Destruir a Infraestrutura:**
    Se você não precisar mais do cluster, pode destruir todos os recursos criados com um único comando.
    ```bash
    terraform destroy
    ```

## Referências

- [Guia de Instalação do Talos no Proxmox](https://www.talos.dev/v1.11/talos-guides/install/virtualized-platforms/proxmox/)
- [Documentação do Provedor Proxmox para Terraform](https://registry.terraform.io/providers/Telmate/proxmox/latest)