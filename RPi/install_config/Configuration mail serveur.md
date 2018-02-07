# configuration mail serveur

doc source [http://www.tropfacile.net/doku.php/raspberry-pi/comment-installer-un-serveur-mail](ici)

Dans OVH créer un DynHost 

et un sous domaine mail.domaine.fr

Dans la zone DNS
créer une entrée type mail : MX

ajouter la cible mail.domaine.fr.


# Livebox

ouvrir les ports 


# RPI

install postfix

configurer postfix

~~~
smtpd_banner = $myhostname ESMTP $mail_name (Debian/GNU)

biff = no
append_dot_mydomain = no
readme_directory = no

# TLS parameters
smtpd_tls_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
smtpd_tls_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
smtpd_use_tls= yes
smtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache
smtp_tls_session_cache_database = btree:${data_directory}/smtp_scache
smtpd_tls_auth_only = no

# Postfix parameters
myhostname = mail.geodatup.fr
alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases
myorigin = /etc/mailname
mydestination = geodatup.fr, localhost
mynetworks = 127.0.0.0/8
mailbox_size_limit = 0
recipient_delimiter = +
inet_interfaces = all
inet_protocols = ipv4
home_mailbox = Maildir/
~~~