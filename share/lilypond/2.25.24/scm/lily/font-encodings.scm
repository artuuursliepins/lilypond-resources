;;;; font-encodings.scm
;;;;
;;;; A hash to quickly retrieve the corresponding font encoding of a glyph
;;;; name.
;;;;
;;;; This file was generated by `generate-encodings.ly`.  It is part of
;;;; LilyPond, the GNU music typesetter.
;;;;
;;;; Copyright (C) 2022--2023 Werner Lemberg <wl@gnu.org>
;;;;
;;;; LilyPond is free software: you can redistribute it and/or modify
;;;; it under the terms of the GNU General Public License as published by
;;;; the Free Software Foundation, either version 3 of the License, or
;;;; (at your option) any later version.
;;;;
;;;; LilyPond is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;; GNU General Public License for more details.
;;;;
;;;; You should have received a copy of the GNU General Public License
;;;; along with LilyPond.  If not, see <http://www.gnu.org/licenses/>.

(define-public glyph-encoding-table (make-hash-table 655))
(define (g k v) (hash-set! glyph-encoding-table k v))

(g "noteheads.d0doFunk" "N")
(g "noteheads.d0fa" "N")
(g "noteheads.d0faFunk" "N")
(g "noteheads.d0faThin" "N")
(g "noteheads.d0miFunk" "N")
(g "noteheads.d0reFunk" "N")
(g "noteheads.d0tiFunk" "N")
(g "noteheads.d1doFunk" "N")
(g "noteheads.d1doWalker" "N")
(g "noteheads.d1fa" "N")
(g "noteheads.d1faFunk" "N")
(g "noteheads.d1faThin" "N")
(g "noteheads.d1faWalker" "N")
(g "noteheads.d1miFunk" "N")
(g "noteheads.d1reFunk" "N")
(g "noteheads.d1reWalker" "N")
(g "noteheads.d1tiFunk" "N")
(g "noteheads.d1tiWalker" "N")
(g "noteheads.d2doFunk" "N")
(g "noteheads.d2doWalker" "N")
(g "noteheads.d2fa" "N")
(g "noteheads.d2faFunk" "N")
(g "noteheads.d2faThin" "N")
(g "noteheads.d2faWalker" "N")
(g "noteheads.d2kievan" "N")
(g "noteheads.d2reFunk" "N")
(g "noteheads.d2reWalker" "N")
(g "noteheads.d2tiFunk" "N")
(g "noteheads.d2tiWalker" "N")
(g "noteheads.d3kievan" "N")
(g "noteheads.dM2" "N")
(g "noteheads.dM2blackmensural" "N")
(g "noteheads.dM2mensural" "N")
(g "noteheads.dM2neomensural" "N")
(g "noteheads.dM2semimensural" "N")
(g "noteheads.dM3blackmensural" "N")
(g "noteheads.dM3mensural" "N")
(g "noteheads.dM3neomensural" "N")
(g "noteheads.dM3semimensural" "N")
(g "noteheads.drM2mensural" "N")
(g "noteheads.drM2neomensural" "N")
(g "noteheads.drM2semimensural" "N")
(g "noteheads.drM3mensural" "N")
(g "noteheads.drM3neomensural" "N")
(g "noteheads.drM3semimensural" "N")
(g "noteheads.s0" "N")
(g "noteheads.s0blackmensural" "N")
(g "noteheads.s0blackpetrucci" "N")
(g "noteheads.s0cross" "N")
(g "noteheads.s0diamond" "N")
(g "noteheads.s0do" "N")
(g "noteheads.s0doThin" "N")
(g "noteheads.s0doWalker" "N")
(g "noteheads.s0faWalker" "N")
(g "noteheads.s0harmonic" "N")
(g "noteheads.s0kievan" "N")
(g "noteheads.s0la" "N")
(g "noteheads.s0laFunk" "N")
(g "noteheads.s0laThin" "N")
(g "noteheads.s0laWalker" "N")
(g "noteheads.s0mensural" "N")
(g "noteheads.s0mi" "N")
(g "noteheads.s0miMirror" "N")
(g "noteheads.s0miThin" "N")
(g "noteheads.s0miWalker" "N")
(g "noteheads.s0neomensural" "N")
(g "noteheads.s0petrucci" "N")
(g "noteheads.s0re" "N")
(g "noteheads.s0reThin" "N")
(g "noteheads.s0reWalker" "N")
(g "noteheads.s0slash" "N")
(g "noteheads.s0sol" "N")
(g "noteheads.s0solFunk" "N")
(g "noteheads.s0ti" "N")
(g "noteheads.s0tiThin" "N")
(g "noteheads.s0tiWalker" "N")
(g "noteheads.s0triangle" "N")
(g "noteheads.s1" "N")
(g "noteheads.s1blackpetrucci" "N")
(g "noteheads.s1cross" "N")
(g "noteheads.s1diamond" "N")
(g "noteheads.s1do" "N")
(g "noteheads.s1doThin" "N")
(g "noteheads.s1kievan" "N")
(g "noteheads.s1la" "N")
(g "noteheads.s1laFunk" "N")
(g "noteheads.s1laThin" "N")
(g "noteheads.s1laWalker" "N")
(g "noteheads.s1mensural" "N")
(g "noteheads.s1mi" "N")
(g "noteheads.s1miMirror" "N")
(g "noteheads.s1miThin" "N")
(g "noteheads.s1miWalker" "N")
(g "noteheads.s1neomensural" "N")
(g "noteheads.s1petrucci" "N")
(g "noteheads.s1re" "N")
(g "noteheads.s1reThin" "N")
(g "noteheads.s1slash" "N")
(g "noteheads.s1sol" "N")
(g "noteheads.s1solFunk" "N")
(g "noteheads.s1ti" "N")
(g "noteheads.s1tiThin" "N")
(g "noteheads.s1triangle" "N")
(g "noteheads.s2" "N")
(g "noteheads.s2blackpetrucci" "N")
(g "noteheads.s2cross" "N")
(g "noteheads.s2diamond" "N")
(g "noteheads.s2do" "N")
(g "noteheads.s2doThin" "N")
(g "noteheads.s2harmonic" "N")
(g "noteheads.s2la" "N")
(g "noteheads.s2laFunk" "N")
(g "noteheads.s2laThin" "N")
(g "noteheads.s2laWalker" "N")
(g "noteheads.s2mensural" "N")
(g "noteheads.s2mi" "N")
(g "noteheads.s2miFunk" "N")
(g "noteheads.s2miMirror" "N")
(g "noteheads.s2miThin" "N")
(g "noteheads.s2miWalker" "N")
(g "noteheads.s2neomensural" "N")
(g "noteheads.s2petrucci" "N")
(g "noteheads.s2re" "N")
(g "noteheads.s2reThin" "N")
(g "noteheads.s2slash" "N")
(g "noteheads.s2sol" "N")
(g "noteheads.s2solFunk" "N")
(g "noteheads.s2ti" "N")
(g "noteheads.s2tiThin" "N")
(g "noteheads.s2triangle" "N")
(g "noteheads.s2xcircle" "N")
(g "noteheads.sM1" "N")
(g "noteheads.sM1blackmensural" "N")
(g "noteheads.sM1double" "N")
(g "noteheads.sM1kievan" "N")
(g "noteheads.sM1mensural" "N")
(g "noteheads.sM1neomensural" "N")
(g "noteheads.sM1semimensural" "N")
(g "noteheads.sM2blackligmensural" "N")
(g "noteheads.sM2kievan" "N")
(g "noteheads.sM2ligmensural" "N")
(g "noteheads.sM2semiligmensural" "N")
(g "noteheads.sM3blackligmensural" "N")
(g "noteheads.sM3ligmensural" "N")
(g "noteheads.sM3semiligmensural" "N")
(g "noteheads.shufnagel.lpes" "N")
(g "noteheads.shufnagel.punctum" "N")
(g "noteheads.shufnagel.virga" "N")
(g "noteheads.smedicaea.inclinatum" "N")
(g "noteheads.smedicaea.punctum" "N")
(g "noteheads.smedicaea.rvirga" "N")
(g "noteheads.smedicaea.virga" "N")
(g "noteheads.sr1kievan" "N")
(g "noteheads.srM1mensural" "N")
(g "noteheads.srM1neomensural" "N")
(g "noteheads.srM1semimensural" "N")
(g "noteheads.srM2ligmensural" "N")
(g "noteheads.srM2semiligmensural" "N")
(g "noteheads.srM3ligmensural" "N")
(g "noteheads.srM3semiligmensural" "N")
(g "noteheads.ssolesmes.auct.asc" "N")
(g "noteheads.ssolesmes.auct.desc" "N")
(g "noteheads.ssolesmes.incl.auctum" "N")
(g "noteheads.ssolesmes.incl.parvum" "N")
(g "noteheads.ssolesmes.oriscus" "N")
(g "noteheads.ssolesmes.stropha" "N")
(g "noteheads.ssolesmes.stropha.aucta" "N")
(g "noteheads.svaticana.cephalicus" "N")
(g "noteheads.svaticana.epiphonus" "N")
(g "noteheads.svaticana.inclinatum" "N")
(g "noteheads.svaticana.inner.cephalicus" "N")
(g "noteheads.svaticana.linea.punctum" "N")
(g "noteheads.svaticana.linea.punctum.cavum" "N")
(g "noteheads.svaticana.lpes" "N")
(g "noteheads.svaticana.plica" "N")
(g "noteheads.svaticana.punctum" "N")
(g "noteheads.svaticana.punctum.cavum" "N")
(g "noteheads.svaticana.quilisma" "N")
(g "noteheads.svaticana.reverse.plica" "N")
(g "noteheads.svaticana.reverse.vplica" "N")
(g "noteheads.svaticana.upes" "N")
(g "noteheads.svaticana.vepiphonus" "N")
(g "noteheads.svaticana.vlpes" "N")
(g "noteheads.svaticana.vplica" "N")
(g "noteheads.svaticana.vupes" "N")
(g "noteheads.u0doFunk" "N")
(g "noteheads.u0fa" "N")
(g "noteheads.u0faFunk" "N")
(g "noteheads.u0faThin" "N")
(g "noteheads.u0miFunk" "N")
(g "noteheads.u0reFunk" "N")
(g "noteheads.u0tiFunk" "N")
(g "noteheads.u1doFunk" "N")
(g "noteheads.u1doWalker" "N")
(g "noteheads.u1fa" "N")
(g "noteheads.u1faFunk" "N")
(g "noteheads.u1faThin" "N")
(g "noteheads.u1faWalker" "N")
(g "noteheads.u1miFunk" "N")
(g "noteheads.u1reFunk" "N")
(g "noteheads.u1reWalker" "N")
(g "noteheads.u1tiFunk" "N")
(g "noteheads.u1tiWalker" "N")
(g "noteheads.u2doFunk" "N")
(g "noteheads.u2doWalker" "N")
(g "noteheads.u2fa" "N")
(g "noteheads.u2faFunk" "N")
(g "noteheads.u2faThin" "N")
(g "noteheads.u2faWalker" "N")
(g "noteheads.u2kievan" "N")
(g "noteheads.u2reFunk" "N")
(g "noteheads.u2reWalker" "N")
(g "noteheads.u2tiFunk" "N")
(g "noteheads.u2tiWalker" "N")
(g "noteheads.u3kievan" "N")
(g "noteheads.uM2" "N")
(g "noteheads.uM2blackmensural" "N")
(g "noteheads.uM2mensural" "N")
(g "noteheads.uM2neomensural" "N")
(g "noteheads.uM2semimensural" "N")
(g "noteheads.uM3blackmensural" "N")
(g "noteheads.uM3mensural" "N")
(g "noteheads.uM3neomensural" "N")
(g "noteheads.uM3semimensural" "N")
(g "noteheads.urM2mensural" "N")
(g "noteheads.urM2neomensural" "N")
(g "noteheads.urM2semimensural" "N")
(g "noteheads.urM3mensural" "N")
(g "noteheads.urM3neomensural" "N")
(g "noteheads.urM3semimensural" "N")

(g "clefs.C" "S")
(g "clefs.C_change" "S")
(g "clefs.F" "S")
(g "clefs.F_change" "S")
(g "clefs.G" "S")
(g "clefs.GG" "S")
(g "clefs.GG_change" "S")
(g "clefs.G_change" "S")
(g "clefs.blackmensural.c" "S")
(g "clefs.blackmensural.c_change" "S")
(g "clefs.hufnagel.do" "S")
(g "clefs.hufnagel.do.fa" "S")
(g "clefs.hufnagel.do.fa_change" "S")
(g "clefs.hufnagel.do_change" "S")
(g "clefs.hufnagel.fa" "S")
(g "clefs.hufnagel.fa_change" "S")
(g "clefs.kievan.do" "S")
(g "clefs.kievan.do_change" "S")
(g "clefs.medicaea.do" "S")
(g "clefs.medicaea.do_change" "S")
(g "clefs.medicaea.fa" "S")
(g "clefs.medicaea.fa_change" "S")
(g "clefs.mensural.c" "S")
(g "clefs.mensural.c_change" "S")
(g "clefs.mensural.f" "S")
(g "clefs.mensural.f_change" "S")
(g "clefs.mensural.g" "S")
(g "clefs.mensural.g_change" "S")
(g "clefs.neomensural.c" "S")
(g "clefs.neomensural.c_change" "S")
(g "clefs.percussion" "S")
(g "clefs.percussion_change" "S")
(g "clefs.petrucci.c1" "S")
(g "clefs.petrucci.c1_change" "S")
(g "clefs.petrucci.c2" "S")
(g "clefs.petrucci.c2_change" "S")
(g "clefs.petrucci.c3" "S")
(g "clefs.petrucci.c3_change" "S")
(g "clefs.petrucci.c4" "S")
(g "clefs.petrucci.c4_change" "S")
(g "clefs.petrucci.c5" "S")
(g "clefs.petrucci.c5_change" "S")
(g "clefs.petrucci.f" "S")
(g "clefs.petrucci.f_change" "S")
(g "clefs.petrucci.g" "S")
(g "clefs.petrucci.g_change" "S")
(g "clefs.tab" "S")
(g "clefs.tab_change" "S")
(g "clefs.tenorG" "S")
(g "clefs.tenorG_change" "S")
(g "clefs.varC" "S")
(g "clefs.varC_change" "S")
(g "clefs.varpercussion" "S")
(g "clefs.varpercussion_change" "S")
(g "clefs.vaticana.do" "S")
(g "clefs.vaticana.do_change" "S")
(g "clefs.vaticana.fa" "S")
(g "clefs.vaticana.fa_change" "S")
(g "scripts.arpeggio" "S")
(g "scripts.arpeggio.arrow.1" "S")
(g "scripts.arpeggio.arrow.M1" "S")
(g "scripts.barline.kievan" "S")
(g "scripts.caesura.curved" "S")
(g "scripts.caesura.straight" "S")
(g "scripts.circulus" "S")
(g "scripts.coda" "S")
(g "scripts.daccentus" "S")
(g "scripts.ddownbow" "S")
(g "scripts.dfermata" "S")
(g "scripts.dhenzelongfermata" "S")
(g "scripts.dhenzeshortfermata" "S")
(g "scripts.dlongfermata" "S")
(g "scripts.dmarcato" "S")
(g "scripts.downmordent" "S")
(g "scripts.downprall" "S")
(g "scripts.dpedalheel" "S")
(g "scripts.dpedaltoe" "S")
(g "scripts.dportato" "S")
(g "scripts.dsemicirculus" "S")
(g "scripts.dshortfermata" "S")
(g "scripts.dsignumcongruentiae" "S")
(g "scripts.dstaccatissimo" "S")
(g "scripts.dupbow" "S")
(g "scripts.dverylongfermata" "S")
(g "scripts.dveryshortfermata" "S")
(g "scripts.espr" "S")
(g "scripts.flageolet" "S")
(g "scripts.halfopen" "S")
(g "scripts.halfopenvertical" "S")
(g "scripts.haydnturn" "S")
(g "scripts.ictus" "S")
(g "scripts.laltcomma" "S")
(g "scripts.lcomma" "S")
(g "scripts.lineprall" "S")
(g "scripts.lvarcomma" "S")
(g "scripts.mordent" "S")
(g "scripts.open" "S")
(g "scripts.prall" "S")
(g "scripts.pralldown" "S")
(g "scripts.prallmordent" "S")
(g "scripts.prallprall" "S")
(g "scripts.prallup" "S")
(g "scripts.raltcomma" "S")
(g "scripts.rcomma" "S")
(g "scripts.reverseturn" "S")
(g "scripts.rvarcomma" "S")
(g "scripts.segno" "S")
(g "scripts.sforzato" "S")
(g "scripts.slashturn" "S")
(g "scripts.snappizzicato" "S")
(g "scripts.staccato" "S")
(g "scripts.stopped" "S")
(g "scripts.tenuto" "S")
(g "scripts.thumb" "S")
(g "scripts.tickmark" "S")
(g "scripts.trill" "S")
(g "scripts.trill_element" "S")
(g "scripts.turn" "S")
(g "scripts.uaccentus" "S")
(g "scripts.udownbow" "S")
(g "scripts.ufermata" "S")
(g "scripts.uhenzelongfermata" "S")
(g "scripts.uhenzeshortfermata" "S")
(g "scripts.ulongfermata" "S")
(g "scripts.umarcato" "S")
(g "scripts.upedalheel" "S")
(g "scripts.upedaltoe" "S")
(g "scripts.upmordent" "S")
(g "scripts.uportato" "S")
(g "scripts.upprall" "S")
(g "scripts.usemicirculus" "S")
(g "scripts.ushortfermata" "S")
(g "scripts.usignumcongruentiae" "S")
(g "scripts.ustaccatissimo" "S")
(g "scripts.uupbow" "S")
(g "scripts.uverylongfermata" "S")
(g "scripts.uveryshortfermata" "S")
(g "scripts.varcoda" "S")
(g "scripts.varsegno" "S")

(g "accidentals.doublesharp" "O")
(g "accidentals.flat" "O")
(g "accidentals.flat.arrowboth" "O")
(g "accidentals.flat.arrowdown" "O")
(g "accidentals.flat.arrowup" "O")
(g "accidentals.flat.koron" "O")
(g "accidentals.flat.slash" "O")
(g "accidentals.flat.slashslash" "O")
(g "accidentals.flatflat" "O")
(g "accidentals.flatflat.slash" "O")
(g "accidentals.hufnagelM1" "O")
(g "accidentals.kievan1" "O")
(g "accidentals.kievanM1" "O")
(g "accidentals.leftparen" "O")
(g "accidentals.medicaeaM1" "O")
(g "accidentals.mensural1" "O")
(g "accidentals.mensuralM1" "O")
(g "accidentals.mirroredflat" "O")
(g "accidentals.mirroredflat.backslash" "O")
(g "accidentals.mirroredflat.flat" "O")
(g "accidentals.natural" "O")
(g "accidentals.natural.arrowboth" "O")
(g "accidentals.natural.arrowdown" "O")
(g "accidentals.natural.arrowup" "O")
(g "accidentals.rightparen" "O")
(g "accidentals.sharp" "O")
(g "accidentals.sharp.arrowboth" "O")
(g "accidentals.sharp.arrowdown" "O")
(g "accidentals.sharp.arrowup" "O")
(g "accidentals.sharp.slash.stem" "O")
(g "accidentals.sharp.slashslash.stem" "O")
(g "accidentals.sharp.slashslash.stemstemstem" "O")
(g "accidentals.sharp.slashslashslash.stem" "O")
(g "accidentals.sharp.slashslashslash.stemstem" "O")
(g "accidentals.sharp.sori" "O")
(g "accidentals.vaticana0" "O")
(g "accidentals.vaticanaM1" "O")
(g "accordion.bayanbass" "O")
(g "accordion.discant" "O")
(g "accordion.dot" "O")
(g "accordion.freebass" "O")
(g "accordion.oldEE" "O")
(g "accordion.pull" "O")
(g "accordion.push" "O")
(g "accordion.stdbass" "O")
(g "arrowheads.close.01" "O")
(g "arrowheads.close.0M1" "O")
(g "arrowheads.close.11" "O")
(g "arrowheads.close.1M1" "O")
(g "arrowheads.open.01" "O")
(g "arrowheads.open.0M1" "O")
(g "arrowheads.open.11" "O")
(g "arrowheads.open.1M1" "O")
(g "brackettips.down" "O")
(g "brackettips.up" "O")
(g "custodes.hufnagel.d0" "O")
(g "custodes.hufnagel.d1" "O")
(g "custodes.hufnagel.d2" "O")
(g "custodes.hufnagel.u0" "O")
(g "custodes.hufnagel.u1" "O")
(g "custodes.hufnagel.u2" "O")
(g "custodes.medicaea.d0" "O")
(g "custodes.medicaea.d1" "O")
(g "custodes.medicaea.d2" "O")
(g "custodes.medicaea.u0" "O")
(g "custodes.medicaea.u1" "O")
(g "custodes.medicaea.u2" "O")
(g "custodes.mensural.d0" "O")
(g "custodes.mensural.d1" "O")
(g "custodes.mensural.d2" "O")
(g "custodes.mensural.u0" "O")
(g "custodes.mensural.u1" "O")
(g "custodes.mensural.u2" "O")
(g "custodes.vaticana.d0" "O")
(g "custodes.vaticana.d1" "O")
(g "custodes.vaticana.d2" "O")
(g "custodes.vaticana.u0" "O")
(g "custodes.vaticana.u1" "O")
(g "custodes.vaticana.u2" "O")
(g "dots.dot" "O")
(g "dots.dotkievan" "O")
(g "dots.dotvaticana" "O")
(g "flags.d10" "O")
(g "flags.d3" "O")
(g "flags.d4" "O")
(g "flags.d5" "O")
(g "flags.d6" "O")
(g "flags.d7" "O")
(g "flags.d8" "O")
(g "flags.d9" "O")
(g "flags.dgrace" "O")
(g "flags.mensurald03" "O")
(g "flags.mensurald04" "O")
(g "flags.mensurald05" "O")
(g "flags.mensurald06" "O")
(g "flags.mensurald13" "O")
(g "flags.mensurald14" "O")
(g "flags.mensurald15" "O")
(g "flags.mensurald16" "O")
(g "flags.mensurald23" "O")
(g "flags.mensurald24" "O")
(g "flags.mensurald25" "O")
(g "flags.mensurald26" "O")
(g "flags.mensuralu03" "O")
(g "flags.mensuralu04" "O")
(g "flags.mensuralu05" "O")
(g "flags.mensuralu06" "O")
(g "flags.mensuralu13" "O")
(g "flags.mensuralu14" "O")
(g "flags.mensuralu15" "O")
(g "flags.mensuralu16" "O")
(g "flags.mensuralu23" "O")
(g "flags.mensuralu24" "O")
(g "flags.mensuralu25" "O")
(g "flags.mensuralu26" "O")
(g "flags.stackedd10" "O")
(g "flags.stackedd3" "O")
(g "flags.stackedd4" "O")
(g "flags.stackedd5" "O")
(g "flags.stackedd6" "O")
(g "flags.stackedd7" "O")
(g "flags.stackedd8" "O")
(g "flags.stackedd9" "O")
(g "flags.stackedu10" "O")
(g "flags.stackedu3" "O")
(g "flags.stackedu4" "O")
(g "flags.stackedu5" "O")
(g "flags.stackedu6" "O")
(g "flags.stackedu7" "O")
(g "flags.stackedu8" "O")
(g "flags.stackedu9" "O")
(g "flags.u10" "O")
(g "flags.u3" "O")
(g "flags.u4" "O")
(g "flags.u5" "O")
(g "flags.u6" "O")
(g "flags.u7" "O")
(g "flags.u8" "O")
(g "flags.u9" "O")
(g "flags.ugrace" "O")
(g "pedal.*" "O")
(g "pedal.." "O")
(g "pedal.M" "O")
(g "pedal.P" "O")
(g "pedal.Ped" "O")
(g "pedal.d" "O")
(g "pedal.e" "O")
(g "rests.0" "O")
(g "rests.0mensural" "O")
(g "rests.0neomensural" "O")
(g "rests.0o" "O")
(g "rests.1" "O")
(g "rests.10" "O")
(g "rests.1mensural" "O")
(g "rests.1neomensural" "O")
(g "rests.1o" "O")
(g "rests.2" "O")
(g "rests.2classical" "O")
(g "rests.2mensural" "O")
(g "rests.2neomensural" "O")
(g "rests.2z" "O")
(g "rests.3" "O")
(g "rests.3mensural" "O")
(g "rests.3neomensural" "O")
(g "rests.4" "O")
(g "rests.4mensural" "O")
(g "rests.4neomensural" "O")
(g "rests.5" "O")
(g "rests.6" "O")
(g "rests.7" "O")
(g "rests.8" "O")
(g "rests.9" "O")
(g "rests.M1" "O")
(g "rests.M1mensural" "O")
(g "rests.M1neomensural" "O")
(g "rests.M1o" "O")
(g "rests.M2" "O")
(g "rests.M2mensural" "O")
(g "rests.M2neomensural" "O")
(g "rests.M3" "O")
(g "rests.M3mensural" "O")
(g "rests.M3neomensural" "O")
(g "ties.lyric.default" "O")
(g "ties.lyric.short" "O")
(g "timesig.C22" "O")
(g "timesig.C44" "O")
(g "timesig.mensural22" "O")
(g "timesig.mensural24" "O")
(g "timesig.mensural32" "O")
(g "timesig.mensural34" "O")
(g "timesig.mensural44" "O")
(g "timesig.mensural48" "O")
(g "timesig.mensural64" "O")
(g "timesig.mensural68" "O")
(g "timesig.mensural68alt" "O")
(g "timesig.mensural94" "O")
(g "timesig.mensural98" "O")
(g "timesig.neomensural22" "O")
(g "timesig.neomensural24" "O")
(g "timesig.neomensural32" "O")
(g "timesig.neomensural34" "O")
(g "timesig.neomensural44" "O")
(g "timesig.neomensural48" "O")
(g "timesig.neomensural64" "O")
(g "timesig.neomensural68" "O")
(g "timesig.neomensural68alt" "O")
(g "timesig.neomensural94" "O")
(g "timesig.neomensural98" "O")

(g "accidentals.doublesharp.figbass" "P")
(g "accidentals.flat.figbass" "P")
(g "accidentals.flatflat.figbass" "P")
(g "accidentals.natural.figbass" "P")
(g "accidentals.sharp.figbass" "P")
(g "comma" "P")
(g "eight" "P")
(g "endash" "P")
(g "f" "P")
(g "fattened.eight" "P")
(g "fattened.five" "P")
(g "fattened.fixedwidth.eight" "P")
(g "fattened.fixedwidth.five" "P")
(g "fattened.fixedwidth.four" "P")
(g "fattened.fixedwidth.four.alt" "P")
(g "fattened.fixedwidth.nine" "P")
(g "fattened.fixedwidth.one" "P")
(g "fattened.fixedwidth.seven" "P")
(g "fattened.fixedwidth.seven.alt" "P")
(g "fattened.fixedwidth.six" "P")
(g "fattened.fixedwidth.three" "P")
(g "fattened.fixedwidth.two" "P")
(g "fattened.fixedwidth.zero" "P")
(g "fattened.four" "P")
(g "fattened.four.alt" "P")
(g "fattened.nine" "P")
(g "fattened.one" "P")
(g "fattened.seven" "P")
(g "fattened.seven.alt" "P")
(g "fattened.six" "P")
(g "fattened.three" "P")
(g "fattened.two" "P")
(g "fattened.zero" "P")
(g "figbass.fiveplus" "P")
(g "figbass.fourplus" "P")
(g "figbass.ninestroked" "P")
(g "figbass.sevenstroked" "P")
(g "figbass.sixstroked" "P")
(g "figbass.twoplus" "P")
(g "figuredash" "P")
(g "five" "P")
(g "fixedwidth.eight" "P")
(g "fixedwidth.five" "P")
(g "fixedwidth.four" "P")
(g "fixedwidth.four.alt" "P")
(g "fixedwidth.nine" "P")
(g "fixedwidth.one" "P")
(g "fixedwidth.seven" "P")
(g "fixedwidth.seven.alt" "P")
(g "fixedwidth.six" "P")
(g "fixedwidth.three" "P")
(g "fixedwidth.two" "P")
(g "fixedwidth.zero" "P")
(g "four" "P")
(g "four.alt" "P")
(g "hyphen" "P")
(g "m" "P")
(g "n" "P")
(g "nine" "P")
(g "one" "P")
(g "p" "P")
(g "parenleft" "P")
(g "parenright" "P")
(g "period" "P")
(g "plus" "P")
(g "r" "P")
(g "s" "P")
(g "seven" "P")
(g "seven.alt" "P")
(g "six" "P")
(g "space" "P")
(g "three" "P")
(g "two" "P")
(g "u2007" "P")
(g "u2009" "P")
(g "u200A" "P")
(g "z" "P")
(g "zero" "P")

(define-public brace-encoding-table (make-hash-table 576))
(define (b k v) (hash-set! brace-encoding-table k v))

(b "brace0" "N")
(b "brace1" "N")
(b "brace10" "N")
(b "brace100" "N")
(b "brace101" "N")
(b "brace102" "N")
(b "brace103" "N")
(b "brace104" "N")
(b "brace105" "N")
(b "brace106" "N")
(b "brace107" "N")
(b "brace108" "N")
(b "brace109" "N")
(b "brace11" "N")
(b "brace110" "N")
(b "brace111" "N")
(b "brace112" "N")
(b "brace113" "N")
(b "brace114" "N")
(b "brace115" "N")
(b "brace116" "N")
(b "brace117" "N")
(b "brace118" "N")
(b "brace119" "N")
(b "brace12" "N")
(b "brace120" "N")
(b "brace121" "N")
(b "brace122" "N")
(b "brace123" "N")
(b "brace124" "N")
(b "brace125" "N")
(b "brace126" "N")
(b "brace127" "N")
(b "brace128" "N")
(b "brace129" "N")
(b "brace13" "N")
(b "brace130" "N")
(b "brace131" "N")
(b "brace132" "N")
(b "brace133" "N")
(b "brace134" "N")
(b "brace135" "N")
(b "brace136" "N")
(b "brace137" "N")
(b "brace138" "N")
(b "brace139" "N")
(b "brace14" "N")
(b "brace140" "N")
(b "brace141" "N")
(b "brace142" "N")
(b "brace143" "N")
(b "brace144" "N")
(b "brace145" "N")
(b "brace146" "N")
(b "brace147" "N")
(b "brace148" "N")
(b "brace149" "N")
(b "brace15" "N")
(b "brace150" "N")
(b "brace151" "N")
(b "brace152" "N")
(b "brace153" "N")
(b "brace154" "N")
(b "brace155" "N")
(b "brace156" "N")
(b "brace157" "N")
(b "brace158" "N")
(b "brace159" "N")
(b "brace16" "N")
(b "brace160" "N")
(b "brace161" "N")
(b "brace162" "N")
(b "brace163" "N")
(b "brace164" "N")
(b "brace165" "N")
(b "brace166" "N")
(b "brace167" "N")
(b "brace168" "N")
(b "brace169" "N")
(b "brace17" "N")
(b "brace170" "N")
(b "brace171" "N")
(b "brace172" "N")
(b "brace173" "N")
(b "brace174" "N")
(b "brace175" "N")
(b "brace176" "N")
(b "brace177" "N")
(b "brace178" "N")
(b "brace179" "N")
(b "brace18" "N")
(b "brace180" "N")
(b "brace181" "N")
(b "brace182" "N")
(b "brace183" "N")
(b "brace184" "N")
(b "brace185" "N")
(b "brace186" "N")
(b "brace187" "N")
(b "brace188" "N")
(b "brace189" "N")
(b "brace19" "N")
(b "brace190" "N")
(b "brace191" "N")
(b "brace192" "N")
(b "brace193" "N")
(b "brace194" "N")
(b "brace195" "N")
(b "brace196" "N")
(b "brace197" "N")
(b "brace198" "N")
(b "brace199" "N")
(b "brace2" "N")
(b "brace20" "N")
(b "brace21" "N")
(b "brace22" "N")
(b "brace23" "N")
(b "brace24" "N")
(b "brace25" "N")
(b "brace26" "N")
(b "brace27" "N")
(b "brace28" "N")
(b "brace29" "N")
(b "brace3" "N")
(b "brace30" "N")
(b "brace31" "N")
(b "brace32" "N")
(b "brace33" "N")
(b "brace34" "N")
(b "brace35" "N")
(b "brace36" "N")
(b "brace37" "N")
(b "brace38" "N")
(b "brace39" "N")
(b "brace4" "N")
(b "brace40" "N")
(b "brace41" "N")
(b "brace42" "N")
(b "brace43" "N")
(b "brace44" "N")
(b "brace45" "N")
(b "brace46" "N")
(b "brace47" "N")
(b "brace48" "N")
(b "brace49" "N")
(b "brace5" "N")
(b "brace50" "N")
(b "brace51" "N")
(b "brace52" "N")
(b "brace53" "N")
(b "brace54" "N")
(b "brace55" "N")
(b "brace56" "N")
(b "brace57" "N")
(b "brace58" "N")
(b "brace59" "N")
(b "brace6" "N")
(b "brace60" "N")
(b "brace61" "N")
(b "brace62" "N")
(b "brace63" "N")
(b "brace64" "N")
(b "brace65" "N")
(b "brace66" "N")
(b "brace67" "N")
(b "brace68" "N")
(b "brace69" "N")
(b "brace7" "N")
(b "brace70" "N")
(b "brace71" "N")
(b "brace72" "N")
(b "brace73" "N")
(b "brace74" "N")
(b "brace75" "N")
(b "brace76" "N")
(b "brace77" "N")
(b "brace78" "N")
(b "brace79" "N")
(b "brace8" "N")
(b "brace80" "N")
(b "brace81" "N")
(b "brace82" "N")
(b "brace83" "N")
(b "brace84" "N")
(b "brace85" "N")
(b "brace86" "N")
(b "brace87" "N")
(b "brace88" "N")
(b "brace89" "N")
(b "brace9" "N")
(b "brace90" "N")
(b "brace91" "N")
(b "brace92" "N")
(b "brace93" "N")
(b "brace94" "N")
(b "brace95" "N")
(b "brace96" "N")
(b "brace97" "N")
(b "brace98" "N")
(b "brace99" "N")

(b "brace200" "S")
(b "brace201" "S")
(b "brace202" "S")
(b "brace203" "S")
(b "brace204" "S")
(b "brace205" "S")
(b "brace206" "S")
(b "brace207" "S")
(b "brace208" "S")
(b "brace209" "S")
(b "brace210" "S")
(b "brace211" "S")
(b "brace212" "S")
(b "brace213" "S")
(b "brace214" "S")
(b "brace215" "S")
(b "brace216" "S")
(b "brace217" "S")
(b "brace218" "S")
(b "brace219" "S")
(b "brace220" "S")
(b "brace221" "S")
(b "brace222" "S")
(b "brace223" "S")
(b "brace224" "S")
(b "brace225" "S")
(b "brace226" "S")
(b "brace227" "S")
(b "brace228" "S")
(b "brace229" "S")
(b "brace230" "S")
(b "brace231" "S")
(b "brace232" "S")
(b "brace233" "S")
(b "brace234" "S")
(b "brace235" "S")
(b "brace236" "S")
(b "brace237" "S")
(b "brace238" "S")
(b "brace239" "S")
(b "brace240" "S")
(b "brace241" "S")
(b "brace242" "S")
(b "brace243" "S")
(b "brace244" "S")
(b "brace245" "S")
(b "brace246" "S")
(b "brace247" "S")
(b "brace248" "S")
(b "brace249" "S")
(b "brace250" "S")
(b "brace251" "S")
(b "brace252" "S")
(b "brace253" "S")
(b "brace254" "S")
(b "brace255" "S")
(b "brace256" "S")
(b "brace257" "S")
(b "brace258" "S")
(b "brace259" "S")
(b "brace260" "S")
(b "brace261" "S")
(b "brace262" "S")
(b "brace263" "S")
(b "brace264" "S")
(b "brace265" "S")
(b "brace266" "S")
(b "brace267" "S")
(b "brace268" "S")
(b "brace269" "S")
(b "brace270" "S")
(b "brace271" "S")
(b "brace272" "S")
(b "brace273" "S")
(b "brace274" "S")
(b "brace275" "S")
(b "brace276" "S")
(b "brace277" "S")
(b "brace278" "S")
(b "brace279" "S")
(b "brace280" "S")
(b "brace281" "S")
(b "brace282" "S")
(b "brace283" "S")
(b "brace284" "S")
(b "brace285" "S")
(b "brace286" "S")
(b "brace287" "S")
(b "brace288" "S")
(b "brace289" "S")
(b "brace290" "S")
(b "brace291" "S")
(b "brace292" "S")
(b "brace293" "S")
(b "brace294" "S")
(b "brace295" "S")
(b "brace296" "S")
(b "brace297" "S")
(b "brace298" "S")
(b "brace299" "S")
(b "brace300" "S")
(b "brace301" "S")
(b "brace302" "S")
(b "brace303" "S")
(b "brace304" "S")
(b "brace305" "S")
(b "brace306" "S")
(b "brace307" "S")
(b "brace308" "S")
(b "brace309" "S")
(b "brace310" "S")
(b "brace311" "S")
(b "brace312" "S")
(b "brace313" "S")
(b "brace314" "S")
(b "brace315" "S")
(b "brace316" "S")
(b "brace317" "S")
(b "brace318" "S")
(b "brace319" "S")
(b "brace320" "S")
(b "brace321" "S")
(b "brace322" "S")
(b "brace323" "S")
(b "brace324" "S")
(b "brace325" "S")
(b "brace326" "S")
(b "brace327" "S")
(b "brace328" "S")
(b "brace329" "S")
(b "brace330" "S")
(b "brace331" "S")
(b "brace332" "S")
(b "brace333" "S")
(b "brace334" "S")
(b "brace335" "S")
(b "brace336" "S")
(b "brace337" "S")
(b "brace338" "S")
(b "brace339" "S")
(b "brace340" "S")
(b "brace341" "S")
(b "brace342" "S")
(b "brace343" "S")
(b "brace344" "S")
(b "brace345" "S")
(b "brace346" "S")
(b "brace347" "S")
(b "brace348" "S")
(b "brace349" "S")
(b "brace350" "S")
(b "brace351" "S")
(b "brace352" "S")
(b "brace353" "S")
(b "brace354" "S")
(b "brace355" "S")
(b "brace356" "S")
(b "brace357" "S")
(b "brace358" "S")
(b "brace359" "S")
(b "brace360" "S")
(b "brace361" "S")
(b "brace362" "S")
(b "brace363" "S")
(b "brace364" "S")
(b "brace365" "S")
(b "brace366" "S")
(b "brace367" "S")
(b "brace368" "S")
(b "brace369" "S")
(b "brace370" "S")
(b "brace371" "S")
(b "brace372" "S")
(b "brace373" "S")
(b "brace374" "S")
(b "brace375" "S")
(b "brace376" "S")
(b "brace377" "S")
(b "brace378" "S")
(b "brace379" "S")
(b "brace380" "S")
(b "brace381" "S")
(b "brace382" "S")
(b "brace383" "S")
(b "brace384" "S")
(b "brace385" "S")
(b "brace386" "S")
(b "brace387" "S")
(b "brace388" "S")
(b "brace389" "S")
(b "brace390" "S")
(b "brace391" "S")
(b "brace392" "S")
(b "brace393" "S")
(b "brace394" "S")
(b "brace395" "S")
(b "brace396" "S")
(b "brace397" "S")
(b "brace398" "S")
(b "brace399" "S")

(b "brace400" "O")
(b "brace401" "O")
(b "brace402" "O")
(b "brace403" "O")
(b "brace404" "O")
(b "brace405" "O")
(b "brace406" "O")
(b "brace407" "O")
(b "brace408" "O")
(b "brace409" "O")
(b "brace410" "O")
(b "brace411" "O")
(b "brace412" "O")
(b "brace413" "O")
(b "brace414" "O")
(b "brace415" "O")
(b "brace416" "O")
(b "brace417" "O")
(b "brace418" "O")
(b "brace419" "O")
(b "brace420" "O")
(b "brace421" "O")
(b "brace422" "O")
(b "brace423" "O")
(b "brace424" "O")
(b "brace425" "O")
(b "brace426" "O")
(b "brace427" "O")
(b "brace428" "O")
(b "brace429" "O")
(b "brace430" "O")
(b "brace431" "O")
(b "brace432" "O")
(b "brace433" "O")
(b "brace434" "O")
(b "brace435" "O")
(b "brace436" "O")
(b "brace437" "O")
(b "brace438" "O")
(b "brace439" "O")
(b "brace440" "O")
(b "brace441" "O")
(b "brace442" "O")
(b "brace443" "O")
(b "brace444" "O")
(b "brace445" "O")
(b "brace446" "O")
(b "brace447" "O")
(b "brace448" "O")
(b "brace449" "O")
(b "brace450" "O")
(b "brace451" "O")
(b "brace452" "O")
(b "brace453" "O")
(b "brace454" "O")
(b "brace455" "O")
(b "brace456" "O")
(b "brace457" "O")
(b "brace458" "O")
(b "brace459" "O")
(b "brace460" "O")
(b "brace461" "O")
(b "brace462" "O")
(b "brace463" "O")
(b "brace464" "O")
(b "brace465" "O")
(b "brace466" "O")
(b "brace467" "O")
(b "brace468" "O")
(b "brace469" "O")
(b "brace470" "O")
(b "brace471" "O")
(b "brace472" "O")
(b "brace473" "O")
(b "brace474" "O")
(b "brace475" "O")
(b "brace476" "O")
(b "brace477" "O")
(b "brace478" "O")
(b "brace479" "O")
(b "brace480" "O")
(b "brace481" "O")
(b "brace482" "O")
(b "brace483" "O")
(b "brace484" "O")
(b "brace485" "O")
(b "brace486" "O")
(b "brace487" "O")
(b "brace488" "O")
(b "brace489" "O")
(b "brace490" "O")
(b "brace491" "O")
(b "brace492" "O")
(b "brace493" "O")
(b "brace494" "O")
(b "brace495" "O")
(b "brace496" "O")
(b "brace497" "O")
(b "brace498" "O")
(b "brace499" "O")

(b "brace500" "P")
(b "brace501" "P")
(b "brace502" "P")
(b "brace503" "P")
(b "brace504" "P")
(b "brace505" "P")
(b "brace506" "P")
(b "brace507" "P")
(b "brace508" "P")
(b "brace509" "P")
(b "brace510" "P")
(b "brace511" "P")
(b "brace512" "P")
(b "brace513" "P")
(b "brace514" "P")
(b "brace515" "P")
(b "brace516" "P")
(b "brace517" "P")
(b "brace518" "P")
(b "brace519" "P")
(b "brace520" "P")
(b "brace521" "P")
(b "brace522" "P")
(b "brace523" "P")
(b "brace524" "P")
(b "brace525" "P")
(b "brace526" "P")
(b "brace527" "P")
(b "brace528" "P")
(b "brace529" "P")
(b "brace530" "P")
(b "brace531" "P")
(b "brace532" "P")
(b "brace533" "P")
(b "brace534" "P")
(b "brace535" "P")
(b "brace536" "P")
(b "brace537" "P")
(b "brace538" "P")
(b "brace539" "P")
(b "brace540" "P")
(b "brace541" "P")
(b "brace542" "P")
(b "brace543" "P")
(b "brace544" "P")
(b "brace545" "P")
(b "brace546" "P")
(b "brace547" "P")
(b "brace548" "P")
(b "brace549" "P")
(b "brace550" "P")
(b "brace551" "P")
(b "brace552" "P")
(b "brace553" "P")
(b "brace554" "P")
(b "brace555" "P")
(b "brace556" "P")
(b "brace557" "P")
(b "brace558" "P")
(b "brace559" "P")
(b "brace560" "P")
(b "brace561" "P")
(b "brace562" "P")
(b "brace563" "P")
(b "brace564" "P")
(b "brace565" "P")
(b "brace566" "P")
(b "brace567" "P")
(b "brace568" "P")
(b "brace569" "P")
(b "brace570" "P")
(b "brace571" "P")
(b "brace572" "P")
(b "brace573" "P")
(b "brace574" "P")
(b "brace575" "P")
