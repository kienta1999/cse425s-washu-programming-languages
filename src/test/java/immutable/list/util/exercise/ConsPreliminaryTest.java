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

import static immutable.list.util.exercise.ImLists.cons;
import static immutable.list.util.exercise.ImLists.nil;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import immutable.list.util.core.ImList;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
public class ConsPreliminaryTest {
	@Test
	public void test() {
		ImList<String> empty = nil();
		assertNotNull(empty);
		assertTrue(empty.isEmpty());

		ImList<String> e = cons("e", empty);
		assertNotNull(e);
		assertFalse(e.isEmpty());
		assertEquals(e.head(), "e");
		ImList<String> e_nil = e.tail();
		assertSame(e_nil, empty);
		assertNotNull(e_nil);
		assertTrue(e_nil.isEmpty());

		ImList<String> de = cons("d", e);
		assertNotNull(de);
		assertFalse(de.isEmpty());
		assertEquals(de.head(), "d");
		ImList<String> de_e = de.tail();
		assertSame(e, de_e);
		assertFalse(de_e.isEmpty());
		assertEquals(de_e.head(), "e");
		ImList<String> de_nil = de_e.tail();
		assertSame(de_nil, empty);
		assertNotNull(de_nil);
		assertTrue(de_nil.isEmpty());

		ImList<String> cde = cons("c", de);
		assertNotNull(cde);
		assertFalse(cde.isEmpty());
		assertEquals(cde.head(), "c");
		ImList<String> cde_d = cde.tail();
		assertSame(de, cde_d);
		assertFalse(cde_d.isEmpty());
		assertEquals(cde_d.head(), "d");
		ImList<String> cde_e = cde_d.tail();
		assertSame(e, cde_e);
		assertFalse(cde_e.isEmpty());
		assertEquals(cde_e.head(), "e");
		ImList<String> cde_nil = cde_e.tail();
		assertSame(cde_nil, empty);
		assertNotNull(cde_nil);
		assertTrue(cde_nil.isEmpty());

		ImList<String> bcde = cons("b", cde);
		assertNotNull(bcde);
		assertFalse(bcde.isEmpty());
		assertEquals(bcde.head(), "b");
		assertSame(cde, bcde.tail());
		assertSame(de, bcde.tail().tail());
		assertSame(e, bcde.tail().tail().tail());
		assertSame(empty, bcde.tail().tail().tail().tail());

		ImList<String> abcde = cons("a", bcde);
		assertNotNull(abcde);
		assertFalse(abcde.isEmpty());
		assertEquals(abcde.head(), "a");
		assertSame(bcde, abcde.tail());
		assertSame(cde, abcde.tail().tail());
		assertSame(de, abcde.tail().tail().tail());
		assertSame(e, abcde.tail().tail().tail().tail());
		assertSame(empty, abcde.tail().tail().tail().tail().tail());
	}
}
