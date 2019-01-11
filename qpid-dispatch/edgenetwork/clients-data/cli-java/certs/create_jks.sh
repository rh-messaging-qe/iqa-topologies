KEYSTORE="${KEYSTORE:-keystore.jks}"
CSR_FILE="${CSR_FILE:-jks-csr.pem}"
PEM_FILE="${PEM_FILE:-jks.pem}"
CA_KEY_FILE="${CA_KEY_FILE:-ca-key.pem}"
CA_PEM_FILE="${CA_PEM_FILE:-ca-certificate.pem}"
STOREPASS="${STOREPASS:-redhat}"
KEYPASS="${KEYPASS:-redhat}"
ALIAS="${ALIAS:-client}"
CA_ALIAS="${CA_ALIAS:-ca}"
COMMON_NAME="${COMMON_NAME:-client}"

# Removing existing files
rm -f jks-csr.pem ca-certificate.srl jks.pem keystore.jks

# Generating a java keystore
keytool -noprompt -storetype pkcs12 -storepass "${STOREPASS}" -keypass "${KEYPASS}" -keystore ${KEYSTORE} -genkey -alias ${ALIAS} -dname "CN=${COMMON_NAME}"

# Generating a CSR file for the given key
keytool -noprompt -storepass "${STOREPASS}" -keystore ${KEYSTORE} -dname "CN=${COMMON_NAME}" -certreq -alias "${ALIAS}" -keyalg rsa -file ${CSR_FILE}

# Generating a signed certificate
openssl x509 -req -in ${CSR_FILE} -CA ${CA_PEM_FILE} -CAkey ${CA_KEY_FILE} -CAcreateserial -out ${PEM_FILE} -days 1095 -sha256

# Importing CA PEM Certificate into keystore
keytool -noprompt -storepass "${STOREPASS}" -import -keystore ${KEYSTORE} -file ${CA_PEM_FILE} -alias ${CA_ALIAS}

# Importing signed certificate into keystore"
keytool -noprompt -storepass "${STOREPASS}" -import -keystore ${KEYSTORE} -file ${PEM_FILE} -alias ${ALIAS}

