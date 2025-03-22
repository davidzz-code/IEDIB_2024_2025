import json
from datetime import datetime
from kafka import KafkaConsumer
from hdfs import InsecureClient

HDFS_FILE = '/user/hadoop/kafka/apartado1.csv'
hdfs_client = InsecureClient('http://hadoopmaster:9870', user='hadoop')
DATETIME_FORMAT = '%d/%m/%Y %H:%M:%S' # Formato del Datetime

# Crea el archivo si no existe
if not hdfs_client.status(HDFS_FILE, strict=False):
	with hdfs_client.write(HDFS_FILE, overwrite=True) as writer:
		writer.write(b'')

consumer = KafkaConsumer('apartado-1',
	bootstrap_servers=['localhost:9092'],
	auto_offset_reset='earliest',
	enable_auto_commit=True,
	group_id='my_group_id',
	value_deserializer=lambda x: json.loads(x.decode('utf-8'))
)

for message in consumer:
	msg = message.value
	print('Mensaje: ', msg)
	payload = msg.get('payload', {}) 
	values = payload.split(',') # Separar los valores por coma

	datetime_str = f'{values[0]} {values[1]}' # Unir los valores de fecha y hora
	datatime_value = datetime.now().strftime('%d/%m/%Y %H:%M:%S')
	try:
		datatime_value = datetime.strptime(datetime_str, DATETIME_FORMAT).strftime('%d/%m/%Y %H:%M:%S')
	except ValueError:
		print(f'Error: Formato de fecha-hora incorrecto: {datetime_str}\nSe usará la fecha-hora actual: {datatime_value}')

	csv_line = f'{datatime_value},{values[2],values[3],values[4]}\n'.encode('utf-8')
	print(csv_line)

	with hdfs_client.write(HDFS_FILE, append=True) as writer:
		writer.write(csv_line)