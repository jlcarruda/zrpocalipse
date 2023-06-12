FROM cm2network/steamcmd:root

RUN mkdir /home/steam/zrpocalipse
RUN chown steam:steam /home/steam/zrpocalipse
COPY run_server.sh /home/steam/zrpocalipse
RUN ./steamcmd.sh +force_install_dir /home/steam/zrpocalipse +login anonymous +app_update 380870 validate +quit

WORKDIR /home/steam/zrpocalipse

EXPOSE 16261/udp
EXPOSE 16262/udp

ENTRYPOINT ["/bin/bash", "/home/steam/zrpocalipse/run_server.sh"]
CMD ["-servername", "ZRPocalipse"]
