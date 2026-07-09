import time
threshold = 100
market_price = 95
start_time = time.perf_counter_ns()

if market_price < threshold:
    buy_signal, sell_signal = True, False
elif market_price > threshold:
    buy_signal, sell_signal = False, True
else:
    buy_signal, sell_signal = False, False

end_time = time.perf_counter_ns()
print(f"Software Execution Latency: {end_time - start_time} ns")
