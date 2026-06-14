cd /tmp/blueprint/blueprints


blueprints=()

for blueprint in */; do
    blueprints+=("$blueprint")
done

echo blueprint