abstract sig TipoVacina{}
sig Name{}
one sig Pfizer, Astrazeneca, CoronaVac extends TipoVacina{}
sig Vacinados{
	primeiraDose: Name -> TipoVacina,
	segundaDose: Name -> TipoVacina
}

// fact auxiliar para limitar como funcionam as doses
fact regrasDasdOoses{
	lone Vacinados.primeiraDose
	lone Vacinados.segundaDose
	all v: Vacinados, n: Name | some v.segundaDose[n] implies some v.primeiraDose[n]
}

/*
a) Elabore um predicado em Alloy que, dada uma pessoa como parâmetro,
    diga se esta pessoa tomou a primeira dose mas não tomou a segunda;
*/
pred tomouPrimeiraDose[n: Name]{
	one Vacinados.primeiraDose[n] and no Vacinados.segundaDose[n]
}

run tomouPrimeiraDose for 5
