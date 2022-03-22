# Kafka

## Shell aliases

```
# kubectl -> kafka aliases
## Manipulate consumer groups
kg () {
    ns=$(kubens -c)
    context=$(kubectl config current-context)
    echo "CTX: $context  NS: $ns"
    kubectl exec -ti kafka-0 -c broker -- /opt/kafka/bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 $@
}
## Manipulate topics
kt () {
    ns=$(kubens -c)
    context=$(kubectl config current-context)
    echo "CTX: $context  NS: $ns"
    kubectl exec -ti kafka-0 -c broker -- /opt/kafka/bin/kafka-topics.sh --zookeeper=kafka-zookeeper:2181/kafka $@
}
## Check length of topic
klt () {
    context=$(kubectl config current-context)
    ns=$(kubens -c)
    echo "CTX: $context  NS: $ns"
    kubectl exec -ti kafka-0 -c broker -- /opt/kafka/bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --time -1 $@
}
```


## "Kafka is reporting an unhealthy state" and "Kafka has under replicated partitions"

This is sometimes caused by a broker shutting down uncleanly (for instance due to a kubernetes worker node restart).
In this case you will be able to see a log message like this in the logs:
```
[2019-11-05 18:31:03,457] ERROR Error while creating ephemeral at /brokers/ids/2, node already exists and owner '2998673882310407095' does not match current session '2998673882310408235' (kafka.zk.KafkaZkClient$CheckedEphemeral)
```

Sometimes a simple node restart is enough to get out of this situation: `kubectl delete po kafka-2`
If that doesn't help a more drastic approach of removing the registration from `zetcd` manually is required.

Install the `zkctl` cli utility:
```
go get github.com/etcd-io/zetcd/cmd/zkctl
```

Port forward zkctl's zookeeper port:
```
kubectl port-forward svc/zetcd 2181
```

[optional] Confirm the owner of the session with:
```
zkctl ls /kafka/brokers/ids/2
```

The output should have a value that lines up with the `node already exists` from the log message.

Now remove the registration from zetcd with:
```
zkctl delete /kafka/brokers/ids/2
```

This should now allow the broker to register again, and cluster health should restore soon after.
