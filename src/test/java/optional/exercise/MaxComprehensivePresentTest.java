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
package optional.exercise;

import static immutable.list.util.exercise.ImLists.brackets;
import static immutable.list.util.exercise.ImLists.cons;
import static immutable.list.util.exercise.ImLists.nil;
import static org.junit.Assert.assertEquals;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import immutable.list.util.core.ImList;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
@RunWith(Parameterized.class)
public class MaxComprehensivePresentTest {
	private final Optional<Integer> expected;
	private final ImList<Integer> xs;

	public MaxComprehensivePresentTest(int expected, ImList<Integer> xs) {
		this.expected = Optional.of(expected);
		this.xs = xs;
	}

	@Test
	public void test() {
		Optional<Integer> actual = Max.maximum(xs);
		assertEquals(expected, actual);
	}

	@Parameterized.Parameters(name = "expected: {0}; xs: {1}")
	public static Collection<Object[]> getConstructorArguments() {
		List<Object[]> args = new LinkedList<>();
		args.add(new Object[] { 425, brackets(425) });
		args.add(new Object[] { 425, brackets(425, 231) });
		args.add(new Object[] { 425, brackets(231, 425) });
		args.add(new Object[] { 71, brackets(71, 17, 8) });
		args.add(new Object[] { 71, brackets(8, 71, 17) });
		args.add(new Object[] { 71, brackets(8, 17, 71) });

		final int MAX_VALUE = 1_000;
		Random random = new Random();
		for (int i = 0; i < 256; ++i) {
			int expectedMax = random.nextInt(MAX_VALUE);
			ImList<Integer> list = cons(expectedMax, nil());
			final int MAX_CONS_COUNT = 16;
			for (int j = 0; j < random.nextInt(MAX_CONS_COUNT); ++j) {
				int v = random.nextInt(1000);
				expectedMax = Math.max(expectedMax, v);
				list = cons(v, list);
			}
			args.add(new Object[] { expectedMax, list });
		}
		return args;
	}
}
