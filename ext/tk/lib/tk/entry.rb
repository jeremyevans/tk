#
#		tk/entry.rb - Tk entry classes
#			$Date$
#			by Yukihiro Matsumoto <matz@caelum.co.jp>

require 'tk'
require 'tk/label'
require 'tk/scrollable'
require 'tk/validation'

class TkEntry<TkLabel
  include Scrollable
  include TkValidation

  TkCommandNames = ['entry'.freeze].freeze
  WidgetClassName = 'Entry'.freeze
  WidgetClassNames[WidgetClassName] = self

  #def create_self(keys)
  #  tk_call_without_enc('entry', @path)
  #  if keys and keys != None
  #    configure(keys)
  #  end
  #end
  #private :create_self

  def bbox(index)
    list(tk_send_without_enc('bbox', index))
  end
  def cursor
    number(tk_send_without_enc('index', 'insert'))
  end
  def cursor=(index)
    tk_send_without_enc('icursor', index)
    #self
    index
  end
  def index(index)
    number(tk_send_without_enc('index', index))
  end
  def insert(pos,text)
    tk_send_without_enc('insert', pos, _get_eval_enc_str(text))
    self
  end
  def delete(first, last=None)
    tk_send_without_enc('delete', first, last)
    self
  end
  def mark(pos)
    tk_send_without_enc('scan', 'mark', pos)
    self
  end
  def dragto(pos)
    tk_send_without_enc('scan', 'dragto', pos)
    self
  end
  def selection_adjust(index)
    tk_send_without_enc('selection', 'adjust', index)
    self
  end
  def selection_clear
    tk_send_without_enc('selection', 'clear')
    self
  end
  def selection_from(index)
    tk_send_without_enc('selection', 'from', index)
    self
  end
  def selection_present()
    bool(tk_send_without_enc('selection', 'present'))
  end
  def selection_range(s, e)
    tk_send_without_enc('selection', 'range', s, e)
    self
  end
  def selection_to(index)
    tk_send_without_enc('selection', 'to', index)
    self
  end

  def invoke_validate
    bool(tk_send_without_enc('validate'))
  end
  def validate(mode = nil)
    if mode
      configure 'validate', mode
    else
      invoke_validate
    end
  end

  def value
    _fromUTF8(tk_send_without_enc('get'))
  end
  def value= (val)
    tk_send_without_enc('delete', 0, 'end')
    tk_send_without_enc('insert', 0, _get_eval_enc_str(val))
    val
  end
  alias get value
  alias set value=

  def [](*args)
    self.value[*args]
  end
  def []=(*args)
    val = args.pop
    str = self.value
    str[*args] = val
    self.value = str
    val
  end
end
