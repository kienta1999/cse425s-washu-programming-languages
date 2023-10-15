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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Iterator;

import org.junit.Test;

import immutable.list.core.ImListTestUtils;
import immutable.list.util.core.ImList;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
public class IteratorMethodIndependentIterationTest {
	@Test
	public void test() {
		ImList<String> list = ImListTestUtils.toImmutableList(Arrays.asList("A", "B", "C", "D", "E"));
		Iterator<String> iterator0 = list.iterator();
		assertNotNull(iterator0);
		assertTrue(iterator0.hasNext());
		assertEquals("A", iterator0.next());
		assertTrue(iterator0.hasNext());
		assertEquals("B", iterator0.next());

		Iterator<String> iterator1 = list.iterator();
		assertNotNull(iterator1);
		assertTrue(iterator1.hasNext());
		assertEquals("A", iterator1.next());

		assertTrue(iterator0.hasNext());
		assertEquals("C", iterator0.next());

		assertTrue(iterator1.hasNext());
		assertEquals("B", iterator1.next());
		assertTrue(iterator1.hasNext());
		assertEquals("C", iterator1.next());
		assertTrue(iterator1.hasNext());
		assertEquals("D", iterator1.next());
		assertTrue(iterator1.hasNext());
		assertEquals("E", iterator1.next());
		assertFalse(iterator1.hasNext());

		assertTrue(iterator0.hasNext());
		assertEquals("D", iterator0.next());
		assertTrue(iterator0.hasNext());
		assertEquals("E", iterator0.next());
		assertFalse(iterator0.hasNext());
	}
}
