module tour/adressBook1
// sig -> representa um conjunto de objetos
sig Name, Addr{}
sig Book{
	addr: Name -> lone Addr // mapeamento de nomes para endereços, onde "lone" garante que cada nome tem no máximo um endereço
}
// temos uma relação de mapeamento entre as 3 assinaturas, onde uma busca de um puxa os demais
// temos uma tupla que tem a relação (Book -> Name -> Addr)
// baseado no design pattern "composite"

pred show(){} //predicado apenas para mapear a relação. Podemos adicionar comandos nos predicados para dar um escopo para o modelo

pred showWithConstraint(b: Book){ //  b: Book =  adiciona um livro específico. Funciona como um parâmetro de uma função,
	#b.addr > 1  /*  b.addr = mapeamento de nomes para endereço do livro 
					# = busca o número de associações presentes nesse mapeamento  */
}// esse predicado busca por livros que tem mais de uma associação nome/endereço

pred inconsistentPred(b:Book){
	#b.addr > 1
	some n: Name | #n.(b.addr) > 1 /* essa limitação impossibilita a execução do modelo por contradizer a estrutura inicial de Book
									     que permite apenas que cada nome tenha no máximo um endereço	*/
}

pred correctedPred(b:Book){
	#b.addr > 1
	#Name.(b.addr) > 1  // agora podemos ter mais de um endereço por livro. vemos todo o set de Names para fazer a verificação
}									

run showWithConstraint for 3 but 1 Book // roda o modelo para testar com 1 objeto Book
