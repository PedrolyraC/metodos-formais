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
c) Elabore uma função em Alloy que retorne o quantitativo de vacinas da
    Pfizer por exemplo que serão necessárias para serem aplicadas como
    segunda dose.
c.1) Considere para isso que todos que receberam a Pfizer na primeira dose
      também o receberão na segunda e que ainda não foram aplicadas segundas
      doses de nenhum tipo de vacina. Como você pode garantir isso no modelo
      Alloy?
*/
fact{
	all n: Name | Vacinados.primeiraDose[n] = Pfizer implies Vacinados.segundaDose[n] = Pfizer
}

fun quantitadePfizerSegundaDose[]: Int {
	#{n: Name | Vacinados.segundaDose[n] = Pfizer}
}

pred faltamQuantasPfizerSegundaDose{
	let n = quantitadePfizerSegundaDose[] | n > 0
}

run faltamQuantasPfizerSegundaDose for 3
