#!/bin/bash


if [ "$(id -u)" -ne 0 ]; then
  echo "Você precisa ser root para executar este script."
  exit 1
fi

echo "Executando como root... continuando o script."

set -e

echo "Creating directories: /public, /adm, /ven, /sec"
mkdir -p /public /adm /ven /sec

echo "Creating groups: GRP_ADM, GRP_VEN, GRP_SEC"
groupadd GRP_ADM 2>/dev/null || true
groupadd GRP_VEN 2>/dev/null || true
groupadd GRP_SEC 2>/dev/null || true

echo "Assigning directory permissions..."

# /public: todos podem acessar
echo "Everyone will have access to /public"
chmod 777 /public
chown root:root /public

# /adm
echo "Only GRP_ADM members have access to /adm"
chown root:GRP_ADM /adm
chmod 770 /adm

# /ven
echo "Only GRP_VEN members have access to /ven"
chown root:GRP_VEN /ven
chmod 770 /ven

# /sec
echo "Only GRP_SEC members have access to /sec"
chown root:GRP_SEC /sec
chmod 770 /sec

echo "Creating users in group GRP_ADM..."
useradd carlos -c "user ADM" -s /bin/bash -m -g GRP_ADM -p $(openssl passwd -6 Senha123)
passwd -e carlos

useradd maria -c "user ADM" -s /bin/bash -m -g GRP_ADM -p $(openssl passwd -6 Senha123)
passwd -e maria

useradd joao -c "user ADM" -s /bin/bash -m -g GRP_ADM -p $(openssl passwd -6 Senha123)
passwd -e joao

echo "Creating users in group GRP_VEN..."
useradd debora -c "user VEN" -s /bin/bash -m -g GRP_VEN -p $(openssl passwd -6 Senha123)
passwd -e debora

useradd sebastiana -c "user VEN" -s /bin/bash -m -g GRP_VEN -p $(openssl passwd -6 Senha123)
passwd -e sebastiana

useradd roberto -c "user VEN" -s /bin/bash -m -g GRP_VEN -p $(openssl passwd -6 Senha123)
passwd -e roberto

echo "Creating users in group GRP_SEC..."
useradd josefina -c "user SEC" -s /bin/bash -m -g GRP_SEC -p $(openssl passwd -6 Senha123)
passwd -e josefina

useradd amanda -c "user SEC" -s /bin/bash -m -g GRP_SEC -p $(openssl passwd -6 Senha123)
passwd -e amanda

useradd rogerio -c "user SEC" -s /bin/bash -m -g GRP_SEC -p $(openssl passwd -6 Senha123)
passwd -e rogerio

echo "✅ Setup complete!"
echo "Directories and users created successfully."
