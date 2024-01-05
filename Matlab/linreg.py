import numpy as np
import matplotlib.pyplot as plt
 
def estimate_coef(x, y):
    n = np.size(x)
    m_x = np.mean(x)
    m_y = np.mean(y)
    SS_xy = np.sum(y*x) - n*m_y*m_x
    SS_xx = np.sum(x*x) - n*m_x*m_x
    c = SS_xy / SS_xx
    m = m_y - c*m_x
    return (m, c)

def plot_regression_line(x, y, b):
    plt.scatter(x, y, color = "m", marker = "o", s = 30)
    y_pred = b[0] + b[1]*x
    plt.plot(x, y_pred, color = "g")
    plt.xlabel('x')
    plt.ylabel('y')
    plt.show()
 
def main():
    x = np.random.randint(0, 10, size=10)
    y = np.random.randint(0, 100, size=10)
    b = estimate_coef(x, y)
    print("Estimated coefficients:\nm = {}  \
          \nc = {}".format(b[0], b[1]))
    plot_regression_line(x, y, b)
 
if __name__ == "__main__":
    main()