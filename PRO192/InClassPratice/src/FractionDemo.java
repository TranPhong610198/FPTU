class Fraction {
    
    private int numer;
    private int denom;

    // Definition
    public Fraction(int num, int den) {
        numer = num;
        denom = den;
        simplify();
    }

    // Simplify
    void simplify() {
        int gcd = findGCD(numer, denom);
        numer /= gcd;
        denom /= gcd;
    }

    // GCD Function
    int findGCD(int a, int b) {
        int temp;
        while (b != 0) {
            temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    // GetNumerator
    public int getNumer() {
        return numer;
    }

    // GetDenominator
    public int getDenom() {
        return denom;
    }

    // Fraction Add Method
    Fraction add(Fraction x) {
        Fraction result;
        if (denom == x.denom) {
            result = new Fraction(x.numer + numer, denom);
        } else {
            int den = denom * x.getDenom();
            int num = numer * x.getDenom() + x.getNumer() * denom;
            result = new Fraction(num, den);
        }
        result.simplify();
        return result;
    }

    // Fraction Subtract Method
    Fraction subtract(Fraction x) {
        Fraction result;
        if (denom == x.denom) {
            result = new Fraction(numer - x.numer, denom);
        } else {
            int den = denom * x.getDenom();
            int num = numer * x.getDenom() - x.getNumer() * denom;
            result = new Fraction(num, den);
        }
        result.simplify();
        return result;
    }

    // Fraction Multiply Method
    Fraction multiply(Fraction x) {
        Fraction result = new Fraction(numer * x.getNumer(), denom * x.getDenom());
        result.simplify();
        return result;
    }

    // Fraction Divide Method
    Fraction divide(Fraction x) {
        Fraction result = new Fraction(numer * x.getDenom(), denom * x.getNumer());
        result.simplify();
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Fraction fraction = (Fraction) obj;
        return numer == fraction.numer && denom == fraction.denom;
    }

    // ToString
    @Override
    public String toString() {
        return numer + "/" + denom;
    }
}
public class FractionDemo {

    public static void main(String[] args) {
        Fraction a = new Fraction(1, 2);
        Fraction b = new Fraction(3, 4);

        System.out.println("Addition result: " + a.add(b).toString());
        System.out.println("Subtraction result: " + a.subtract(b).toString());
        System.out.println("Multiplication result: " + a.multiply(b).toString());
        System.out.println("Division result: " + a.divide(b).toString());
    }
}
