while True: #while(enquanto) para caso digitar letras ou entradas invalidas, repetir.
    try:
        primeira_nota = float(input("Primeira nota: "))
        segunda_nota = float(input("Segunda nota: "))
        terceira_nota = float(input("Terceira nota: "))
        break #Caso digitar entradas validas sai do loop
    except ValueError:
        print("Erro: Entrada inválida. Por favor, digite um número e tente novamente.")

media = (primeira_nota + segunda_nota + terceira_nota)/3

print("A média aritmética simples de suas notas é: ", round(media,2)) #round para ficar so duas casas decimais.