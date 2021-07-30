# Supported tags and respective `Dockerfile` links

- [`5.24.0` (*5.24.0/Dockerfile*)](https://github.com/dcm4che-dockerfiles/dcm4chee-arc-ui/blob/5.24.0/Dockerfile)
- [`5.24.0-secure` (*5.24.0-secure/Dockerfile*)](https://github.com/dcm4che-dockerfiles/dcm4chee-arc-ui/blob/5.24.0-secure/Dockerfile)

## How to use this image

See [Running on Docker](https://github.com/dcm4che/dcm4chee-arc-light/wiki/Running-on-Docker) at the
[dcm4che Archive 5 Wiki](https://github.com/dcm4che/dcm4chee-arc-light/wiki).

## Environment Variables

Below explained environment variables can be set as per one's application to override the default values if need be.
An example of how one can set an env variable in `docker run` command is shown below :

    -e ARCHIVE_DEVICE_NAME=my-dcm4chee-arc

#### `ARCHIVE_DEVICE_NAME`

Device name to lookup in LDAP for UI configuration (optional, default is `dcm4chee-arc`).

#### `DCM4CHEE_ARC_URLS`

Space separated list of URL(s) of Archive RESTful services deployed in other Archive docker container(s).
E.g.: http://test-ng:8080/dcm4chee-arc

#### `JAVA_OPTS`

This environment variable is used to set the JAVA_OPTS during Archive UI startup (optional, default is 
`"-Xms64m -Xmx512m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true"`

#### `WILDFLY_WAIT_FOR`

Indicates to delay the start of the Archive UI until specified TCP ports become accessible. Format: `<host>:<port> ...`, e.g.: `ldap:389 db:5432`.

#### `HTTP_PORT`

HTTP port of the Archive UI (optional, default is `8080`).

#### `HTTPS_PORT`

HTTPS port of Archive UI (optional, default is `8443`).

#### `MANAGEMENT_HTTP_PORT`

HTTP port of Wildfly Administration Console (optional, default is `9990`).

#### `MANAGEMENT_HTTPS_PORT`

HTTPS port of Wildfly Administration Console (optional, default is `9993`).

#### `WILDFLY_ADMIN_OIDC` (Only effective by Archive UI version secured by Keycloak)

Protect Wildfly Adminstration Console with Keycloak (optional, default is `true`).

#### `WILDFLY_ADMIN_USER` (Ignored by Archive UI version secured by Keycloak and `WILDFLY_ADMIN_OIDC=true`)

By default there is no admin user created so you won't be able to login to the Wildfly Administration Console.
User to authenticate to the Wildfly Administration Console.
(At archive versions secured by Keycloak and `WILDFLY_ADMIN_OIDC=true`, any user with assigned role `ADMINISTRATOR`
is authorized to access the Wildfly Administration Console.)

#### `WILDFLY_ADMIN_USER_FILE` (Ignored by Archive UI version secured by Keycloak and `WILDFLY_ADMIN_OIDC=true`)

User to authenticate to the Wildfly Administration Console via file input (alternative to WILDFLY_ADMIN_USER).

#### `WILDFLY_ADMIN_PASSWORD` (Ignored by Archive UI version secured by Keycloak and `WILDFLY_ADMIN_OIDC=true`)

User's password to use to authenticate to the Wildfly Administration Console.

#### `WILDFLY_ADMIN_PASSWORD_FILE` (Ignored by Archive UI version secured by Keycloak and `WILDFLY_ADMIN_OIDC=true`)

User's password to use to authenticate to the Wildfly Administration Console via file input (alternative to WILDFLY_ADMIN_PASSWORD).

#### `AUTH_USER_ROLE`

User role required to access the Archive UI (optional, default is `user`).

#### `SUPER_USER_ROLE`

User role to identify super users, which have unrestricted access to all UI functions of the Archive, bypassing the
verification of user permissions (optional, default is `admin`).

#### `KEYSTORE`

Path to keystore file with private key and certificate for HTTPS (optional, default is
`/opt/wildfly/standalone/configuration/keystore/key.p12`, with sample key + certificate:
```
Subject    - CN=PACS_J4C,O=J4CARE,C=AT
Issuer     - CN=IHE Europe CA, O=IHE Europe, C=FR
Valid From - Sun Apr 02 06:38:46 UTC 2017
Valid To   - Fri Apr 02 06:38:46 UTC 2027
MD5 : 7a:b3:f7:5d:cf:6e:84:34:be:5a:7a:12:95:fa:46:76
SHA1 : a9:36:b3:b4:60:63:22:9e:f4:ae:41:d3:3b:97:ca:be:9b:a9:32:e9
```
provided by the docker image only for testing purpose).

#### `KEYSTORE_PASSWORD`

Password used to protect the integrity of the keystore specified by `KEYSTORE` (optional, default is `secret`).

#### `KEYSTORE_PASSWORD_FILE`

Password used to protect the integrity of the keystore specified by `KEYSTORE` via file input
(alternative to `KEYSTORE_PASSWORD`).

#### `KEY_PASSWORD`

Password used to protect the private key in the keystore specified by `KEYSTORE`
(optional, default is value of `KEYSTORE_PASSWORD`).

#### `KEY_PASSWORD_FILE`

Password used to protect the private key in the keystore specified by `KEYSTORE` via file input
(alternative to `KEY_PASSWORD`).

#### `KEYSTORE_TYPE`

Type (`JKS` or `PKCS12`) of the keystore specified by `KEYSTORE` (optional, default is `PKCS12`).

#### `TRUSTSTORE`

Path to keystore file with trusted certificates for TLS (optional, default is the default Java truststore
`/usr/local/openjdk-11/lib/security/cacerts`). s.o. [EXTRA_CACERTS](#extra_cacerts).

#### `TRUSTSTORE_PASSWORD`

Password used to protect the integrity of the keystore specified by `TRUSTSTORE` (optional, default is `changeit`).

#### `TRUSTSTORE_PASSWORD_FILE`

Password used to protect the integrity of the keystore specified by `TRUSTSTORE` via file input
(alternative to `TRUSTSTORE_PASSWORD`).

#### `TRUSTSTORE_TYPE`

Type (`JKS` or `PKCS12`) of the keystore specified by `TRUSTSTORE` (optional, default is `JKS`).

#### `EXTRA_CACERTS`

Path to keystore file with CA certificates imported to default Java truststore (optional, default is
`/opt/wildfly/standalone/configuration/keystore/cacerts.p12`, with sample CA certificate:
```
Subject    - CN=IHE Europe CA,O=IHE Europe,C=FR
Issuer     - CN=IHE Europe CA,O=IHE Europe,C=FR
Valid From - Fri Sep 28 11:19:29 UTC 2012
Valid To   - Wed Sep 28 11:19:29 UTC 2022
MD5 : 64:b6:1b:0f:8d:84:17:da:23:e4:e5:1c:56:ba:06:5d
SHA1 : 54:e0:10:c6:4a:fe:2c:aa:20:3f:50:95:45:82:cb:53:55:6b:07:7f
```
provided by the docker image only for testing purpose).

#### `EXTRA_CACERTS_PASSWORD`

Password used to protect the integrity of the keystore specified by `EXTRA_CACERTS` (optional, default is `secret`).

#### `EXTRA_CACERTS_PASSWORD_FILE`

Password used to protect the integrity of the keystore specified by `EXTRA_CACERTS` via file input
(alternative to `EXTRA_CACERTS_PASSWORD`).

#### `TLS_PROTOCOLS`

Comma separated list of enabled TLS protocols (`SSLv2`, `SSLv3`, `TLSv1`, `TLSv1.1`, `TLSv1.2`, `TLSv1.3`)
(optional, default is `TLSv1.2`). 

#### `CIPHER_SUITE_FILTER`

The filter to apply to specify the enabled cipher suites for TLSv1.2 and below. See
[javadoc](https://wildfly-security.github.io/wildfly-elytron/1.1.x/org/wildfly/security/ssl/CipherSuiteSelector.html#fromString-java.lang.String-)
for possible values. (optional, default is `DEFAULT`).

##### `AUTH_SERVER_URL`

Base URL of the Keycloak server used for authenticating the client requests.
Default value is `http://keycloak:8080/auth`.

##### `REALM_NAME`

Name of the realm configured in Keycloak for securing the UI and RESTful services of the archive,
and the Wildfly Administration Console and Management API (optional, default is `dcm4che`). 

##### `SSL_REQUIRED`

Defining the SSL/HTTPS requirements for interacting with the Keycloak server:
- `none` - HTTPS is not required for any client IP address
- `external` - private IP addresses can access without HTTPS
- `all` - HTTPS is required for all IP addresses

(optional, default is `external`).

#### `ALLOW_ANY_HOSTNAME`

If the Keycloak server requires HTTPS and this config option is set to `true` the Keycloak server’s certificate is 
validated via the truststore, but host name validation is not done (optional, default value set is `true`).

#### `DISABLE_TRUST_MANAGER`

If the Keycloak server requires HTTPS and this config option is set to `true` the Keycloak server’s certificate is 
is **not** validated via the truststore (optional, default value set is `false`).

##### `UI_CLIENT_ID`

Keycloak client ID for securing the UI of the archive (optional, default is `dcm4chee-arc-ui`).

#### `WILDFLY_CONSOLE`

Keycloak client ID for [securing the Wildfly Administration Console](https://docs.jboss.org/author/display/WFLY/Protecting+Wildfly+Adminstration+Console+With+Keycloak)
(optional, default is `wildfly-console`).

#### `WILDFLY_MANAGEMENT`

Keycloak client ID for [securing the Wildfly Management API](https://docs.jboss.org/author/display/WFLY/Protecting+Wildfly+Adminstration+Console+With+Keycloak).
(optional, default is `wildfly-management`).

### [Logstash/GELF Logger](https://logging.paluch.biz/) configuration:

#### `LOGSTASH_HOST`

Hostname/IP-Address of the Logstash host. Required for emitting system logs to [Logstash](https://www.elastic.co/products/logstash).

#### `GELF_FACILITY`

Name of the Facility (optional, default is `wildfly`).

#### `GELF_LEVEL`

Log-Level threshold (optional, default is `WARN`).

#### `GELF_EXTRACT_STACK_TRACE`

Indicates if the Stack-Trace shall be sent in the StackTrace field (optional, default is `true`).

#### `GELF_FILTER_STACK_TRACE`

Indicates if Stack-Trace filtering shall be performed (optional, default is `true`).
