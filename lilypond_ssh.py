import paramiko

HOST = "ssh.frankfurt.render.com"
USER = "srv-cvb0355svqrc73c2qq90"
REMOTE_DIR = "/home/srv-cvb0355svqrc73c2qq90/scores"
LOCAL_FILE = "my_score.ly"
REMOTE_FILE = f"{REMOTE_DIR}/my_score.ly"
OUTPUT_FILE = f"{REMOTE_DIR}/my_score.pdf"

private_key_path = "/home/user/.ssh/id_rsa"
key = paramiko.RSAKey(filename=private_key_path)
client.connect(HOST, username=USER, pkey=key)

sftp = client.open_sftp()
sftp.put(LOCAL_FILE, REMOTE_FILE)
sftp.close()

stdin, stdout, stderr = client.exec_command(f"cd {REMOTE_DIR} && lilypond --pdf my_score.ly")
print(stdout.read().decode())
print(stderr.read().decode())

sftp = client.open_sftp()
sftp.get(OUTPUT_FILE, "my_score.pdf")
sftp.close()

client.close()
print("Renderēšana pabeigta, lejupielādēts my_score.pdf!")
