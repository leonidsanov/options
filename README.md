# Моделирование распределения доходностей финансовых активов и оценка опционов

Распределение доходностей активов подчиняется закону распределения абсолютно непрерывной случайной величины, поэтому задача моделирования распределения доходностей состоит в том, чтобы определить к какому классу абсолютно непрерывных распределений случайной величины относится данное конкретное изучаемое распределение доходностей конкретного актива, индекса или финансового инструмента. Если мы правильно подберём распределение, то можно будет понять какому закону подчиняется данная случайная величина и таким образом сможем контролировать риск и доходность.

*Как оценить распределение доходностей?*

*Как определить параметры функции распределения, чтобы оно наилучшим возможным образом соответствовало данным?*

##### Функция распределения

Функция распределения - ключевой термин из теории вероятностей. Используется в экономике/финансах для моделирования элемента случайности. Функция распределения $F(x)$ характеризует некоторый закон распределения $F$.

Предположим, дневная доходность акции является случайной величиной, подчиняющейся закону $F$. Тогда $F(x)$ - вероятность, что доходность акции в определённый день не превысит $x$%. Что тогда значит F(1%) = 70%? Эта запись означает, что в какой-то конкретный день с вероятностью 70% доходность не превысит 1%.

$F(x)$ может быть любой математической функцией, если она возрастает и ограничена отрезком [0;1]. $f(x)$ - функция плотности распределения, является первой производной от (кумулятивной) функции распределения $F(x)$.

*Зачем нужны распределения?*

Статистические распределения имеют множество финансовых приложений.
**Риск-менеджмент:** если знать, какому закону распределения подчиняется доходность портфеля, можно определить, насколько вероятны убытки и каковы будут потери в определённом сценарии (логика value-at-risk - стоимостной меры риска)

**Портфельный менеджмент:** знание распределения доходностей позволяет более точно определить оптимальный портфель для инвестора с точки зрения риск/доходность или максимизации функции полезности

**Оценка справедливой стоимости:** определение корректного закона распределения важно для оценки многих финансовых инструментов (например, опционов).

*Какие бывают распределения?*

Самое широко распространенное в моделях - нормальное распределение

Используется в: value-at-risk, портфельной теории Марковица, модели кредитного риска Мертона, модели Блэка-Шоулза для оценки опционов, функции полезности инвестора Эрроу-Пратта, модели пробита и т.д.

Мы рассмотрим шесть распределений:
1) Нормальное
2) Лапласа
3) Гиперсекант
4) Коши
5) Стьюдента
6) Логистическое

###### Нормальное распределение

Функция плотности вероятности:

$f(x) = \frac{1}{\sigma\sqrt{2\pi}}e^{-\frac{(x-\mu)^2}{2\sigma^2}}$

Однозначно задается средним и СКО (среднеквадратичное отклонение)

Эксцесс=0 ("плоские" хвосты). Мала вероятность экстремальных значений.

Экстремальные значения маловероятны

У нормального распределения самая высокая энтропия.

###### Логистическое распределение

Функция распределения:

$F(x)=\frac{1}{1+e^{-(\frac{\chi-\mu}{a})}}$

Функция плотности вероятности:

$f(x)=\frac{e^{-(\frac{\chi-\mu}{a})}}{a(1+e^{-(\frac{\chi-\mu}{a})})^{2}}$

Эксцесс=6/5

Оценка параметров (ММ (метод моментов)): простое среднее и

$\sigma^{2}=\frac{a^{2}\pi^{2}}{3}\implies a=\frac{\sigma\sqrt{3}}{\pi}$

###### Гиперболический секант

Функция распределения:

Функция плотности вероятности:

Эксцесс=2

Оценка параметров (ММ): среднее и СКО

###### Распределение Лапласа

Функция распределения:

Функция плотности распределения:

Эксцесс=3

Оценка параметров (ММП (метод максимального правдоподобия)): медиана и среднее абсолютное значение

###### Распределение Стьюдента

Задаётся степенями свободы (df)
Эксцесс - какой угодно!

Оценка параметров (ММ):

###### Распределение Коши

Функция распределения:

Эксцесс, дисперсия - не определены, среднее - бесконечно!

Оценка параметров (ММ): медиана и

*Как оценить распределение?*

*Как определить параметры функции распределения, чтобы оно наилучшим возможным образом соответствовало данным?*

1) Метод моментов: подогнать параметры так, чтобы статистические моменты (среднее, дисперсия, скошенность и/или эксцесс) совпадали
2) Метод максимального правдоподобия: максимизировать функцию

или, что эквивалентно, функцию:

Как проверить распределение?

Как проверить, насколько хорошо функция распределения соответствует реальным данным?

Один из подходов - критерий Колмогорова-Смирнова:
Вычислить супремум - наибольшее абсолютное отклонение от эмпирической функции распределения:

Вычислить р-значение по формуле:

р-значение - вероятность, что эмпирическое распределение подчиняется обозначенному теоретическому закону (убывает с S и n)

Переходим в Python!

# выведем теоретические функции распределения исходя из оценённых параметров
data['нормальное'] = sps.norm.cdf(data[0], loc=mean, scale=std)
data[''] = 1/np.pi
...
rew_data['гиперсекант-ММ'] = 2/np.pi*np.arctan(np.exp(np.pi*(raw_data['return']-mean)/(2*std)))
rew_data['гиперсекант-ММП'] = 2/np.pi*np.arctan(np.exp(np.pi*(raw_data['return']-loc_hypersecant_mle)/(2*scale_hypersecant_mle)))
rew_data['Стьюдент'] = sps.t.cdf((raw_data['return']-loc_student)/(scale_student), df_student, loc=0, scale=1)
rew_data['логистическое-ММ'] = 1/(1+np.exp(-(raw_data['return']-loc_logistic)/scale_logistic))
rew_data['логистическое-ММП'] = 1/(1+np.exp(-(raw_data['return']-loc_logistic_mle)/scale_logistic_mle))

# Сравним теоретические функции распределения с эмпирическими для каждого распределения
distributions = ['нормальное', 'Лаплас', 'гиперсекант-ММ', 'гиперсекант-ММП', 'Коши-ММ', 'Коши-ММП', 'Стьюдент', 'логистическое-ММ', 'логистическое-ММП']
for dist in distributions:
	# вычислим супремум (статистику Колмогорова-Смирнова)
	KS_array = abs(data['rank']-data[dist])
	KS = max(KS_array)

	# вычислим р-значения (вероятность, с которой данные подчиняются этому распределению)
	KS_p = np.exp(-KS**2*len(data))

	# визуализируем результат и выведем результаты теста Колмогорова-Смирнова
	print()
	print()
	print()
	print()
	print()
	if KS_p > 0.1:
		print('распределение подходит')


Модели оценки опционов и торговые стратегии
Блэк-Шоулз и Монте-Карло

#########
# Оценим опционы с помощью модели Блэка-Шоулза
d1 = (np.log(start_price/strike)+(drift+vol**2/2)*maturity)/(vol*maturity**(1/2))
d2 = (np.log(start_price/strike)+(drift-vol**2/2)*maturity)/(vol*maturity**(1/2))

# Нормальное распределение

call_value = start_price*sps.norm.cdf(d1, loc=0, scale=1) - strike*np.exp(-drift*maturity)*sps.norm.cdf(d2, loc=0, scale=1)
put_value = -start_price*sps.norm.cdf(-d1, loc=0, scale=1) + strike*np.exp(-drift*maturity)*sps.norm.cdf(-d2, loc=0, scale=1)

print()
print('Блэк-Шоулз, нормальное распрелеление')
strategy_simulation([call_value, put_value])

# Оценим опционы с помощью метода Монте-Карло

# Нормальное распределение

# Симулируем 1000 сценариев
n_simulations = 1000
call_payoff = 0
put_payoff = 0
for i in range(0, n_simulations):
	price = start_price
	# Симулируем движение акции на протяжении всех торговых дней вплоть до экспирации
	for t in range(0, t_days):
		prob = random.randrange(1, 99, 1)/100
		simulated = sps.norm.ppf(prob, loc=mean, scale=std)
		price = price*np.exp(simulated)
	call_payoff += max(0, price - strike)
	put_payoff += max(0, strike - price)
# Ценность опциона - ожидаемый выигрыш
call_value = call_payoff/n_simulations
put_value = put_payoff/n_simulations

print()
print('Монте-Карло, нормальное распределение')
strategy_simulation([call_value, put_value])

# Стьюдент

n_simulations = 1000
call_payoff = 0
put_payoff = 0
for i in range(0, n_simulations):
	price = start_price
	for t in range(0, t_days):
		prob = random.randrange(1, 99, 1)/100
		simulated = mean + std*sps.t.ppf(prob, df_student)
		price = price*np.exp(simulated)
	call_payoff += max(0, price - strike)
	put_payoff += max(0, strike - price)
call_value = call_payoff/n_simulations
put_value = put_payoff/n_simulations

print()
print('Монте-Карло, распределение Стьюдента')
strategy_simulation([call_value, put_value])

# Коши

n_simulations = 1000
call_payoff = 0
put_payoff = 0
for i in range(0, n_simulations):
	price = start_price
	for t in range(0, t_days):
		prob = random.randrange(1, 99, 1)/100
		simulated = loc_cauchy_mle + scale_cauchy_mle*np.tan(np.pi*prob - np.pi/2)
		price = price*np.exp(simulated)
	call_payoff += max(0, price - strike)
	put_payoff += max(0, strike - price)
call_value = call_payoff/n_simulations
put_value = put_payoff/n_simulations

print()
print('Монте-Карло, распределение Коши')
strategy_simulation([call_value, put_value])