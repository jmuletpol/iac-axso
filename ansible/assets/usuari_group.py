# Petit script per desglosar els grups de cada usuari i construir la relació N:M

def main():
	with open('/etc/group') as f:
		content = f.readlines()

	members = []
	for line in content:
		parts = line.split(':')
		gname = parts[0].strip()
		if len(parts) == 4 and len(parts[3].strip()):
			group_list = parts[3]
			for uname in group_list.split(','):
				members.append(gname+':'+uname.strip())

	with open('/tmp/usuari-grup.csv', 'w+') as f:
		f.write("\n".join(members))


if __name__== "__main__":
	main()

