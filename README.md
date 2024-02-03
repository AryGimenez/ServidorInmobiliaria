# Proyecto de Infraestructura - Configuración de Nagios y WireGuard

## Algunos cambios realizados:

1. **ClamAV Desactivado:** Si están desplegando en Digital Ocean, no funcionará bien. Se agregó `DISABLE_CLAMAV=TRUE` como variable de entorno en `userdata.yaml`.

2. **SPF y DMARC:** Ahora también se generan estos dos registros en su dominio:
   - `tudominio.com. TXT "v=spf1 mx ~all"`
   - `\_dmarc.tudominio.com. TXT "v=DMARC1; p=none; rua=mailto:dmarc-reports@tudominio.com"`

3. **CNAME para SMTP, POP, IMAP:** Algunos clientes buscan, por ejemplo, `smtp.tudominio.com`, por lo que se generan estos CNAME:
   - `smtp.tudominio.com. CNAME mail.tudominio.com.`
   - `pop.tudominio.com. CNAME mail.tudominio.com.`
   - `imap.tudominio.com. CNAME mail.tudominio.com.`

4. **Volumen:** Los datos ahora se almacenan en un volumen para evitar pérdida de datos al regenerar el droplet.

5. **Eliminé la creación del dominio raíz:** Ahora deben agregarlo manualmente si no lo tienen en el DNS.

6. **Puse el dominio raíz en una variable:** Cuando apliquen estos scripts, les preguntará el dominio. Recuerden ingresar el dominio raíz.

7. **Cambie la interpolación de variables:** En Terraform 0.12 no es necesario usar "\${variable}".

8. **Usé la imagen de Debian 10:** Pueden cambiarla por Ubuntu según sus preferencias.

## Consejos luego de tener el servidor instalado:

1. **DKIM:** Agregar el registro DKIM en su DNS desde _Virtual Domains > tudominio.com > DKIM key_.

2. **Usar un SMTP Relay:** Configurar un relay en _System Setting > Email Processing > Default SMTP Route_.

No olviden validar el dominio para evitar que los correos lleguen a spam.
