import pandas as pd
import random
import json
import datetime
from kafka import KafkaProducer

def test():
    df = pd.DataFrame(columns=['time', 'number', 'name' , 'type', 'buyer' , 'seller'])
    bootstrap_servers = ['localhost:9092']
    producer = KafkaProducer(bootstrap_servers=bootstrap_servers)
    topic = 'items-snapshots'
    while True:
        new_row = pd.DataFrame([[datetime.datetime.now(), random.randint(10000, 99999), ''.join(random.choices('abcdefghijklmnopqrstuvwxyz', k=5)), random.choices([True,False]), ''.join(random.choices('abcdefghijklmnopqrstuvwxyz', k=10)), ''.join(random.choices('abcdefghijklmnopqrstuvwxyz', k=10))]],columns=['time','number','name','type', 'buyer', 'seller'])
        df=pd.concat([df,new_row],ignore_index=True)
        new_row=new_row.to_json(orient="records")
        producer.send(topic=topic,key=json.dumps(1).encode('utf-8'),value=json.dumps(new_row))
        if(df.shape[0]>600):
            break
test()
