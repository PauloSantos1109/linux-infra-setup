# Script de Criação Automática de Infraestrutura de Usuários e Diretórios no Linux

## 📜 Visão Geral do Projeto

Este projeto consiste em um **script Shell Script (Bash)** que automatiza a criação de toda uma **infraestrutura de usuários, grupos, diretórios e permissões** em um sistema **Linux**.

O objetivo é aplicar o conceito de **Infraestrutura como Código (IaC)**, garantindo que qualquer nova máquina virtual ou ambiente possa ser configurado de forma rápida, consistente e repetível com a simples execução de um arquivo.

O script realiza as seguintes operações:
1.  **Criação de diretórios** específicos.
2.  **Criação de grupos de usuários** baseados em setores (`GRP_ADM`, `GRP_VEN`, `GRP_SEC`).
3.  **Configuração de permissões** para restringir o acesso aos diretórios apenas aos grupos designados.
4.  **Criação de usuários** e sua alocação automática aos grupos corretos.

---

## 🚀 Como Executar o Script

### Pré-requisitos
* Um sistema operacional **Linux** (testado em distribuições baseadas em Debian/Ubuntu).
* **Permissões de Root** (o script verifica e exige execução como `root`).

### Passo a Passo

1.  **Clone o repositório** (ou baixe o arquivo `cria_infra.sh`):

    ```bash
    git clone [https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git](https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git)
    cd SEU_REPOSITORIO
    ```

2.  **Dê permissão de execução** ao script (supondo que o nome seja `cria_infra.sh`):

    ```bash
    chmod +x config_server.sh
    ```

3.  **Execute o script** como usuário `root`:

    ```bash
    sudo ./config_server.sh
    ```

    O script irá imprimir o progresso da configuração e informará o status final.

---

## ⚙️ Estrutura Criada

Ao ser executado, o script estabelece a seguinte infraestrutura:

### Diretórios e Permissões

| Diretório | Permissão | Proprietário:Grupo | Acesso |
| :--- | :--- | :--- | :--- |
| `/public` | `777` (rwxrwxrwx) | `root:root` | Público (todos os usuários podem acessar) |
| `/adm` | `770` (rwxrwx---) | `root:GRP_ADM` | Restrito ao grupo administrativo |
| `/ven` | `770` (rwxrwx---) | `root:GRP_VEN` | Restrito ao grupo de vendas |
| `/sec` | `770` (rwxrwx---) | `root:GRP_SEC` | Restrito ao grupo de segurança |

### Grupos e Usuários

| Grupo | Usuários Criados | Senha Padrão Inicial | Observação |
| :--- | :--- | :--- | :--- |
| **GRP\_ADM** | `carlos`, `maria`, `joao` | `Senha123` | Usuários do setor **Administrativo** |
| **GRP\_VEN** | `debora`, `sebastiana`, `roberto` | `Senha123` | Usuários do setor de **Vendas** |
| **GRP\_SEC** | `josefina`, `amanda`, `rogerio` | `Senha123` | Usuários do setor de **Segurança** |

⚠️ **Segurança:** O script força a **expiração imediata** da senha. Os usuários serão **obrigados a alterar sua senha** no primeiro login, garantindo maior segurança.

---

## 🧑‍💻 Autor

Feito com 💙 por Paulo Santos
Desenvolvido como parte do desafio de Infraestrutura como Código (IaC) do Bootcamp Linux Experience da Digital Innovation One (DIO).

## 🔗 Referências

Infraestrutura como Código — Criação de Estrutura de Usuários, Diretórios e Permissões (DIO)

Apostila: Principais Comandos do Linux

Documentação oficial: Gerenciamento de Usuários e Grupos no Linux