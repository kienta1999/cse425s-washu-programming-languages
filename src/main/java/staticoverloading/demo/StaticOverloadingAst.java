/*******************************************************************************
 * Copyright (C) 2016-2019 Dennis Cosgrove
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 ******************************************************************************/
package staticoverloading.demo;

abstract class Expression {
}

class IntLiteral extends Expression {
	private final int value;

	public IntLiteral(int value) {
		this.value = value;
	}

	public int getValue() {
		return value;
	}

	@Override
	public String toString() {
		return Integer.toString(this.value);
	}
}

class Add extends Expression {
	private final Expression left;
	private final Expression right;

	Add(Expression left, Expression right) {
		this.left = left;
		this.right = right;
	}

	public Expression getLeft() {
		return left;
	}

	public Expression getRight() {
		return right;
	}

	@Override
	public String toString() {
		return "( " + this.left + " + " + this.right + " )";
	}
}

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
public class StaticOverloadingAst {
	void process(Expression e) {
		System.out.println("process expression: " + e);
	}

	void process(Add add) {
		System.out.println("process add: " + add);
		process(add.getLeft());
		process(add.getRight());
	}

	void printEvens(Expression e) {
	}

	void printEvens(IntLiteral literal) {
		if ((literal.getValue() & 0x1) == 0) {
			System.out.println(literal);
		}
	}

	void printEvens(Add add) {
		printEvens(add.getLeft());
		printEvens(add.getRight());
	}

	public static void main(String[] args) {
		StaticOverloadingAst o = new StaticOverloadingAst();

		Add add = new Add(new IntLiteral(3), new Add(new IntLiteral(4), new Add(new IntLiteral(5), new IntLiteral(6))));
		o.process(add);

		o.printEvens(add);
	}
}
