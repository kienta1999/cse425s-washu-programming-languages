/*******************************************************************************
 * Copyright (C) 2016-2020 Dennis Cosgrove
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
package immutable.list.util.exercise;

import static immutable.list.util.exercise.ImLists.brackets;
import static immutable.list.util.exercise.ImLists.cons;
import static immutable.list.util.exercise.ImLists.nil;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import immutable.list.util.core.ImList;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class BracketsPreliminaryTest {
	@Test
	public void testEmpty() {
		ImList<Integer> viaCons = nil();
		assertNotNull(viaCons);
		assertTrue(viaCons.isEmpty());
		ImList<Integer> viaBrackets = brackets();
		assertNotNull(viaBrackets);
		assertTrue(viaCons.isEmpty());
		assertEquals(viaCons, viaBrackets);
	}

	@Test
	public void testFull() {
		ImList<Integer> viaCons = cons(1, cons(2, (cons(3, cons(4, cons(5, nil()))))));
		ImList<Integer> viaBrackets = brackets(1, 2, 3, 4, 5);
		assertNotNull(viaBrackets);
		assertEquals(viaCons, viaBrackets);

		ImList<Integer> list = viaBrackets;

		for (int i = 1; i < 6; ++i) {
			assertNotNull(list);
			assertFalse(list.isEmpty());
			assertEquals(i, list.head().intValue());
			list = list.tail();
		}

		assertTrue(list.isEmpty());
	}
}
