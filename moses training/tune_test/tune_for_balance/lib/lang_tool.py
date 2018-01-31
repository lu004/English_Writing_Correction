from py4j.java_gateway import JavaGateway
lang_tool=JavaGateway().entry_point # get lang_tool server

def spell_corr(input):
	return lang_tool.spell_correct(input)  

def grammar_check(input):
	for i in lang_tool.run(input):
		if i['QI']=='grammar':
			return False 
	return True	   
