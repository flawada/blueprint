clear


cd /tmp/blueprint/blueprints

blueprints=()
i=0

for blueprint in */; do
  blueprints+=("$blueprint")
  echo "$i) ${blueprint%/}"
  ((i++))
done

read -p "select blueprint: " item
print(${blueprints[$item]})