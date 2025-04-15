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
b) Elabore um predicado em Alloy que diga se a Pfizer foi aplicada como 
    primeira dose em alguém;
*/
pred tomouPfizerPrimeiraDose[n: Name]{
	one n: Name | Vacinados.primeiraDose[n] = Pfizer
}

run tomouPfizerPrimeiraDose for 3
