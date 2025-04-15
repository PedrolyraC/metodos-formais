abstract sig TipoVacina{}
sig Name{}
one sig Pfizer, Astrazeneca, CoronaVac extends TipoVacina{}
sig Vacinados{
	primeiraDose: Name -> TipoVacina,
	segundaDose: Name -> TipoVacina
}

fact regrasDasdOoses{
	lone Vacinados.primeiraDose
	lone Vacinados.segundaDose
	all v: Vacinados, n: Name | some v.segundaDose[n] implies some v.primeiraDose[n]
}

/*
d) Considerando que apenas parte das pessoas receberam a segunda
    dose, elabore um predicado que verifique se o quantitativo de doses ainda
    necessário para imunizar as pessoas totalmente (ou seja, quantos receberam
    a primeira dose mas não a segunda, independentemente do tipo da vacina) é
    maior que 100;
*/
pred quantasVacinasFaltam[]{

}
/*
e) Altere a função em d) para retornar o quantitativo de doses necessário
    de um determinado tipo de vacina, recebido como parâmetro, necessário para
    imunização total das pessoas;
*/
fun contadorDoses[t: TipoVacina]: Int {
	# {n: Name | Vacinados.primeiraDose[n] = t and no Vacinados.segundaDose[n]}
}

pred mostraQuantidadeDePfizerNecessaria {
	let n = contadorDoses[Pfizer] | n > 0
}

run quantitativoDeDosesNecessario for 3
