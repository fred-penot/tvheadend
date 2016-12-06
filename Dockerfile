# TvHeadEnd pour free dans un container
#
# VERSION               0.0.1
#

FROM     ubuntu:yakkety
MAINTAINER Fwedoz "fwedoz@gmail.com"

# Definition des constantes
ENV login_ssh="docker"
ENV password_ssh="docker"

# Mise a jour des depots
RUN (apt-get update && apt-get upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)

# Correction et ajout des depots necessaires
RUN apt install -y -q --reinstall gnupg2
RUN apt install -y -q dirmngr
RUN apt-get install -y -q wget nano git zip openssh-server software-properties-common python-software-properties apt-transport-https php7.0

# Ajout de la cle du depot et installation de TvHeadEnd
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
RUN echo deb https://dl.bintray.com/dreamcat4/ubuntu stable main | tee -a /etc/apt/sources.list 
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y -q install tvheadend

# Ajout utilisateur "${login_ssh}"
RUN adduser --quiet --disabled-password --shell /bin/bash --home /home/${login_ssh} --gecos "User" ${login_ssh}

# Modification du mot de passe pour "${login_ssh}"
RUN echo "${login_ssh}:${password_ssh}" | chpasswd

# Ajout du fichier login/mot de passe pour l interface de TvHeadEnd
RUN rm -f /home/hts/.hts/tvheadend/superuser
COPY superuser /home/hts/.hts/tvheadend/superuser
RUN chown hts:hts /home/hts/.hts/tvheadend/superuser

# Ajout du script d import des logos TV
COPY import_logo.sh /root/import_logo.sh
RUN chmod -f 755 /root/import_logo.sh
RUN sh /root/import_logo.sh

# Ajout du script services.sh au demarrage
COPY services.sh /root/services.sh
RUN chmod -f 755 /root/services.sh
RUN echo "sh /root/services.sh" >> /root/.bashrc

# Ports
EXPOSE 22 80 9981 9983 554

# Point de montage
VOLUME ["/home/${login_ssh}"]
