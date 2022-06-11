from scipy.stats import norm
degrees = []
estimates1 = [8632.067, 196.7082, 86.53574, 94.64373]
estimates2 = [60.86826, 61.64014]
estimates3 = [248.5, 50.5]
# estimate = .2955613
# se = .1116346

estimate = estimates2[-1]
print("Point estimate: ", round(estimate, 2))
print()
for se in np.arange(0, estimate, estimate/10):
    print("Standard error: ", round(se, 2))
    for i in (.90, .95, .99):
        a = estimate - norm.ppf((1 + i) / 2) * se
        b = estimate + norm.ppf((1 + i) / 2) * se
        if estimate > 0: c, sign = a, -1
        else: c, sign = b, 1
        if c * sign < 0:
            print(f'{i*100}%: (', round(a, 2), ", ", round(b, 2),")")
print("________________________")


digits = 5

se = 36.98
i = 0.90

print("Uno star:")
print("Point estimate: ", round(estimate, digits))

print("Standard error: ", round(se, digits))

a = estimate - norm.ppf((1 + i) / 2) * se

b = estimate + norm.ppf((1 + i) / 2) * se

print(f'{i*100}%: (', round(a, digits), ", ", round(b, digits),")")

print()
se = 30.82
i = 0.95
print("Duo stars:")

print("Point estimate: ", round(estimate, digits))

print("Standard error: ", round(se, digits))

a = estimate - norm.ppf((1 + i) / 2) * se

b = estimate + norm.ppf((1 + i) / 2) * se

print(f'{i*100}%: (', round(a, digits), ", ", round(b, digits),")")