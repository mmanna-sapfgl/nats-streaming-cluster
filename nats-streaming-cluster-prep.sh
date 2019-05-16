#! /bin/bash

# cluster node-a
docker run --rm -tid --network=host --name=node-a \
-v /home/nats/streaming1/:/streaming1 \
-v /home/nats/streamer_conf_a.conf:/streamer_conf_a.conf \
-p 4222:4222 -p 6222:6222 -p 8222:8222 \
nats-streaming:latest -p 4222 -m 8222 -c /streamer_conf_a.conf

# cluster node-a
docker run --rm -tid --network=host --name=node-b \
-v /home/nats/streaming1/:/streaming1 \
-v /home/nats/streamer_conf_b.conf:/streamer_conf_b.conf \
-p 4223:4223 -p 6223:6223 -p 8223:8223 \
nats-streaming:latest -p 4223 -m 8223 -c /streamer_conf_b.conf

# cluster node-b
docker run --rm -tid --network=host --name=node-c \
-v /home/nats/streaming1/:/streaming1 \
-v /home/nats/streamer_conf_c.conf:/streamer_conf_c.conf \
-p 4224:4224 -p 6224:6224 -p 8224:8224 \
nats-streaming:latest -p 4224 -m 8224 -c /streamer_conf_c.conf






