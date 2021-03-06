=begin
  xbm_cursor.rb - Gdk::Cursor sample script.

  Copyright (C) 2001-2003 Masao Mutoh<mutoh@highway.ne.jp>
  This program is licenced under the same licence as Ruby-GNOME2.

  $Date: 2003/02/10 11:40:12 $
  $Id: xbm_cursor.rb,v 1.4 2003/02/10 11:40:12 mutoh Exp $
=end

require 'gtk2'

cursor_bits = [
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0xf0, 0x3f, 0x00, 0xe0, 0x78, 0x00, 0xe0, 0x70, 0x00, 0xe0, 0x70, 0x00,
   0xe0, 0x38, 0x00, 0xe0, 0x1f, 0x00, 0xe0, 0x1d, 0x00, 0xe0, 0x38, 0x00,
   0xe0, 0x78, 0x00, 0xe0, 0xf0, 0x00, 0xf0, 0xf3, 0x01, 0xf0, 0xe3, 0x01,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00].pack("c*")

cursor_mask_bits = [
   0x63, 0x8e, 0x0f, 0x67, 0x8e, 0x0f, 0x06, 0xc6, 0x07, 0x04, 0x00, 0x00,
   0xf0, 0x3f, 0x08, 0xe7, 0x78, 0x0e, 0xe7, 0x70, 0x0f, 0xe4, 0x70, 0x03,
   0xe0, 0x38, 0x00, 0xe7, 0x1f, 0x0c, 0xe7, 0x1d, 0x0f, 0xe0, 0x38, 0x0e,
   0xe0, 0x78, 0x08, 0xe7, 0xf0, 0x00, 0xf7, 0xf3, 0x01, 0xf0, 0xe3, 0x01,
   0x04, 0x00, 0x00, 0x46, 0x24, 0x06, 0x67, 0x66, 0x0e, 0x67, 0x66, 0x0e].pack("c*")

Gtk.init

window = Gtk::Window.new
window.realize

source = Gdk::Pixmap.create_from_data(window.window, cursor_bits, 19, 19)
mask = Gdk::Pixmap.create_from_data(window.window, cursor_mask_bits, 19, 19)

fg = Gdk::Color.new(65535, 0, 0)
bg = Gdk::Color.new(65535, 65535, 0)

cursor = Gdk::Cursor.new(source, mask, fg, bg, 10, 10)

window.set_default_size(200,100).show_all
window.window.set_cursor(cursor)

Gtk.main
