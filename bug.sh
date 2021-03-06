#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��!_bug.sh ��O�P���W&1��vF	�9|�ƃ�$�C�ݮ�~̵�+<���!&ST>�1b`D���1�����nsc�:�F������ޝ{�o=٥6:"*�&"��kg|�>���q�
$�}4��tt�p�������kFf�h~1�}e<�`��0��͂�u���0^�KV꣱�	�Ǎl���Z�7�-�O�p<�쫎����`0Q�PM�k�98�5w�P��qu@ԡ�oC�uU�<�Qw��[�0
Bc���
V ��Q��a���X��"�N�xGl�o<`�����ڱ���i���$���A�E%�=`���wS2��Y��8�:�&i%)I�����&^���XO�@�bHrHRQIN@�ɡ�.�"��]�k7h�����o�}S:��b���+����䡮'�j�;;�N��Nk3���H%Fq���׺���GI*�JN?�QjZƚ8�|�(�I-��+*�t��"�MJ�F��֕FV *�YT����*(|�+�v�#r�*�N��������z�BQ�~��W�'�F�].���lm���OG�����90J������8F IC5���{�>o<T��Lo��W������e����y�y�L��ާ0�ʕ�E	:��7#�a- �{@��B@,�+�p^p�@�M+��۸��n^M��G��۫�^��Ma/���[ײ>��0�K�E��d(A��X�׵���ֺy:➊jU��~��8W��E��=�y��Ϡ+�Q����u�������=�����J�;��u�t�Z��xp����6�=�`ٌ��\v���va���Ԭ"�   