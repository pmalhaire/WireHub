wh genkey | tee node_a.sk | wh pubkey | tee node_a.k
wh genkey | tee node_b.sk | wh pubkey | tee node_b.k

echo "name tutorial
subnet 10.0.42.0/24

boot P17zMwXJFbBdJEn05RFIMADw9TX5_m2xgf31OgNKX3w bootstrap.wirehub.io
trust node_a `cat node_a.k`
trust node_b `cat node_b.k`" | tee config

wh up ./config private-key ./node_a.sk
wh up ./config private-key ./node_b.sk

sleep 10
ping node_a
ping node_b
