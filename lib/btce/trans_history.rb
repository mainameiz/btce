module Btce
  class TransHistory

    delegate :key, to: :@core
    delegate :secret, to: :@core
    delegate :utils, to: :@core
    delegate :http, to: :@core

    def initialize(core)
      @core = core
    end

    ###
    # Возвращает историю транзакций.
    #
    # Параметры:
    #
    # имя       обяз? описание                                     принимает значения  стандартное значение
    # from      Нет   номер транзакции, с которой начинать вывод   числовые            0
    # count     Нет   количество транзакций на вывод               числовые            1000
    # from_id   Нет   id транзакции, с которой начинать вывод      числовые            0
    # end_id    Нет   id транзакции, на которой заканчивать вывод  числовые            infinity
    # order     Нет   сортировка                                   ASC или DESC        DESC
    # since     Нет   с какого времени начинать вывод              UNIX time           0
    # end       Нет   с какого времени заканчивать вывод           UNIX time           infinity
    #
    # Примечание: при использовании параметров since или end, параметр order автоматически принимает значение ASC.
    #
    # Пример ответа:
    # {
    #   "success": 1,
    #   "return": {
    #     "1081672": {
    #       "type":      1,
    #       "amount":    1.00000000,
    #       "currency":  "BTC",
    #       "desc":      "BTC Payment",
    #       "status":    2,
    #       "timestamp": 1342448420
    #     }
    #   }
    # }
    #
    def get(params = nil)
      opts = { method: "TransHistory" }

      http.request Btce.uri, opts
    end
  end
end
