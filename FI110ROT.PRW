//Contas a receber
#Include 'Protheus.ch'

User Function FI040ROT()
Local aRotina := {}

Aadd(aRotina,{'TESTE ROTINA 01','U_TESTE01',0 ,4, Nil, .F. } )
Aadd(aRotina,{'TESTE ROTINA 02','U_TESTE02',0 ,4, Nil, .F. } )

Return aRotina


//EXEMPLO CHAMADA FUNÇÃO NO MENU
User Function TESTE01()
    lAllFil := .T. //Se for .T. irá pegar todas as filiais, se for .F. será só da empresa atual
    cFilBk  := cFilAnt
    cEmpBk  := cEmpAnt
    aUnitNeg:= Iif(lAllFil, FWAllGrpCompany(), {SE1->E1_NUM})
    aEmpAux := Iif(lAllFil, FWAllCompany(), {cEmpAnt})
    Local nGrp
    Local nEmp
    Local nAtu
    
    //Percorrendo os grupos de empresa
    For nGrp := 1 To Len(aUnitNeg)
        cUnidNeg := aUnitNeg[nGrp]
        
        //Percorrendo as empresas
        For nEmp := 1 To Len(aEmpAux)
            cEmpAnt := aEmpAux[nEmp]
            aFilAux := FWAllFilial(cEmpAnt)
            //Percorrendo as filiais listadas

            For nAtu:=1 To Len(aFilAux)
                //Se o tamanho da filial for maior, atualiza
                If Len(cFilAnt) > Len(aFilAux[nAtu])
                    cFilAnt := cEmpAnt + aFilAux[nAtu]
                Else
                    cFilAnt := aFilAux[nAtu]
                EndIf 
                
                //Posiciono na empresa (para poder pegar o ident)
                SE1->(DbGoTop())
                SE1->(DbSeek(cUnidNeg+cFilAnt)) //é utilizado o 01, por grupo de empresas, caso necessário rotina pode ser adaptada
            
                //......................
                //Fazer tratamentos necessários neste ponto, se for consultas SQL lembrar de utilizar RetSQLName e FWxFilial
                //......................
            Next
        Next
    Next
    MsgAlert(cFilAnt)
Return



//EXEMPLO CHAMADA FUNÇÃO NO MENU

User Function TESTE02()

    MsgAlert("TESTE 02","Exemplo de chamada de User Function - 02 ",{"OK"})

Return
