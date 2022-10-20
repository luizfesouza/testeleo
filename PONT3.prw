#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

User Function AfterLogin()

/**
3 - Fazer um ponto de entrada ( ao entrar no sistema ) e mostrar uma mensagem informando:
-Código do usuário logado
-Nome do usuário logado
-Nome do ambiente
-Data do servidor
-Data da maquina
-Hora da maquina
-Relação dos Módulos que o usuário tem acesso 
-Na mensagem colocar saudação de bom dia, boa tarde ou boa noite. 
**/

Local cId   := ParamIXB[1] //Id do usuário
Local cNome := ParamIXB[2] //Nome do usuário
Local cTime1 := "00:00"
Local cTime2 := "11:59"
Local cTime3 := "12:00"
Local cTime4 := "17:59"
Local cTime5 := "18:00"
Local cTime6 := "23:59"


If time() >= cTime1 .and. TIME() <= cTime2 
    
    MsgAlert("Bom dia, " + Alltrim(cNome) + " = " + cId + " - " + " efetuou login as "+TIME()+" no dia "+DToC(Date())+" no ambiente "+ GETENVSERVER() +;
             CHR(13)+CHR(10) + "Data do servidor = " + dtoc(GetRmtDate())+;
             CHR(13)+CHR(10) + "Número de módulos disponível para esse usuário = "/** + cValToChar(modulos())**/)
    RETURN

elseif time() >= cTime3 .and. TIME() <= cTime4
    
    MsgAlert("Boa tarde, " + Alltrim(cNome) + " = " + cId + " - " + " efetuou login as "+TIME()+" no dia "+DToC(Date())+" no ambiente "+ GETENVSERVER() +;
             CHR(13)+CHR(10) + "Data do servidor = " + dtoc(GetRmtDate())+;
             CHR(13)+CHR(10) + "Número de módulos disponível para esse usuário = "/** + cValToChar(modulos())**/)
    RETURN

elseif time() >= cTime5 .and. TIME() <= cTime6

    MsgAlert("Boa noite, " + Alltrim(cNome) + " = " + cId + " - " + " efetuou login as "+TIME()+" no dia "+DToC(Date())+" no ambiente "+ GETENVSERVER() +;
             CHR(13)+CHR(10) + "Data do servidor = " + dtoc(GetRmtDate())+;
             CHR(13)+CHR(10) + "Número de módulos disponível para esse usuário = "/** + cValToChar(modulos())**/)
    RETURN

ENDIF

Return .t.


// Static Function modulos()
//     Local j
//         For j:=1 To 84
//             //Verifica se o usuário tem acesso a esse módulo.
//             If SubStr(aUsers[3][j],3,1) != "X"
//                 //preenche work de módulos
//             EndIf
//         Next j

// Return
