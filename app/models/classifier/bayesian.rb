require 'classifier-reborn'

class Classifier::Bayesian

  def initialize messageToClassifier
    @bayesian = ClassifierReborn::Bayes.new 'Good', 'Bad'
    trainning
    @result = classify(messageToClassifier)
  end

  def is_good?
    @result == 'Good'
  end

  def is_bad?
    @result == 'Bad'
  end

  def trainning
    @bayesian.train_good "Com certeza eu irei ajudar, todos precisam de ajuda"
    @bayesian.train_good "Vamos todos fazer nossa parte"
    @bayesian.train_good "Pode contar comigo, irei ajudar nesta ação"
    @bayesian.train_good "Vou compartilhar esta ação, para que mais pessoas possam ver"
    @bayesian.train_good "Pode contar comigo, irei ajudar nesta ação"
    @bayesian.train_good "Vou convidar um amigo meu para participar também, vamos juntos"
    @bayesian.train_good "Eu já ajudei e vou continuar ajudando"
    @bayesian.train_good "Ja realizei esta ação"
    @bayesian.train_good "Posso ajuda-lo"
    @bayesian.train_good "Vou ajudar também"
    @bayesian.train_good "Todos merecem ser ajudados"
    @bayesian.train_good "Claro, contem comigo"
    @bayesian.train_good "Vou levar meu amigo junto, todos vamos"
    @bayesian.train_good "Legal, vou chamar os amigos para ir junto"

    @bayesian.train_bad "Não acho válido esta ação, não contem comigo"
    @bayesian.train_bad "Ao realizar a ação, houve uma situação muito chata"
    @bayesian.train_bad "Não ocorreu tudo certo como gostaríamos"
    @bayesian.train_bad "Você está tentando enganar a ferramenta"
    @bayesian.train_bad "Você só esta interessando nos pontos desta ação"
    @bayesian.train_bad "Esta ação é repetida, por favor, exclua"
    @bayesian.train_bad "A pessoa infelizmente não resistiu"
    @bayesian.train_bad "Não vou ajudar"
    @bayesian.train_bad "Não contem comigo"
    @bayesian.train_bad "Não vou ajudar de forma alguma"
  end

  def classify(text)
    @bayesian.classify text
  end

end
