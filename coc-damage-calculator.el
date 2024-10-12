;;; coc-damage-calculator.el -- A Clash of Clans damage calculator -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Benjamin Denis

;; Author: Benjamin Denis <benjamin_denis@outlook.com>
;; Keywords: coc damage calculator
;; Homepage: https://github.com/S0mbr3/coc-damage-calculator
;; Version: 0.1
;; Package-Requires: ((emacs "27.2") (hydra "0.14.0")

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; This package help finding good combinations of spells, equipements to deal damage to buildings in Clash of Clans.

;;; Code:

;;;###autoload
(defun earthquake-level-picker (level)
  "Pick the good percentage for the earthquake LEVEL."
  (let ((levels '(14.5 17 21 25 29)))
    (elt levels (1- level))))

;;;###autoload
(defun earthquake-damage-calculator (level number hp)
  "Calculate earthquake damage depending of NUMBER LEVEL and HP."
  (let* (( i 2)
	 (damage
	  (/ (* hp (earthquake-level-picker level)) 100) )
	 (first damage)
	 (total first))
    (while (<= i number)
      (setq total (+ total (/ first (- (* 2 i) 1))))
      (setq i (1+ i)))
    total))

;;;###autoload
(defun earthquake-hp-building-left (level number hp)
  "Calculate remaining building HP after NUMBER earthquakes of some LEVEL."
  (interactive "nPress the level of the earthquake:\nnPress the number of earthquakes:\nnPress the hp of the building:")
  (print (format "The building has %d hp left" (- hp(earthquake-damage-calculator level number hp)))))

;;;###autoload
(defun fireball-level-picker (level)
  "Pick the good damage for the fireball LEVEL."
  (let ((levels '(1500 1500 1700 1700 1800 1950 1950 2050 2200 2200 2350 2650 2650 2750 3100 3100 3250 3400 3400 3500 3650 3650 3750 3900 3900 3950 4100))) (elt levels (1- level))))


;;;###autoload
(defun fireball-hp-building-left (level hp)
  "Calculate fireball damage by it's LEVEL building HP."
  (interactive "nPress the level of the fireball: \nnPress the hp of the building: ")
  (print (format "The building has %d hp left" (- hp (fireball-level-picker level)))))

;;;###autoload
(defun fireball-and-earthquake-calculator (fireball-level earthquake-level earthquake-number hp)
  "Calculate damage FIREBALL-LEVEL EARTHQUAKE-LEVEL EARTHQUAKE-NUMBER HP."
  (interactive "nPress the level of the fireball: \nnPress the level of the earthquake: \nnPress the number of earthquakes: \nnPress the hp of the building: ")
  (print (format "The building has %d hp left" (- hp (fireball-level-picker fireball-level ) (earthquake-damage-calculator earthquake-level earthquake-number hp)))))

;;;###autoload
(defun fireball-and-arrow-calculator (fireball-level arrow-level  hp)
  "Calculate damage FIREBALL-LEVEL ARROW-LEVEL HP."
  (interactive "nPress the level of the fireball: \nnPress the level of the giant arrow: \nnPress the hp of the building: ")
  (print (format "The building has %d hp left" (- hp (fireball-level-picker fireball-level ) (giant-arrow-level-picker arrow-level)))))

;;;###autoload
(defun fireball-earthquake-arrow-calculator (fireball-level earthquake-level earthquake-number arrow-level hp)
  "Damage FIREBALL-LEVEL EARTHQUAKE-LEVEL EARTHQUAKE-NUMBER ARROW-LEVEL HP."
  (interactive "nPress the level of the fireball: \nnPress the level of the earthquake: \nnPress the number of earthquakes: \nnPress the level of the giant arrow: \nnPress the hp of the building: ")
  (print (format "The building has %d hp left" (- hp (fireball-level-picker fireball-level ) (earthquake-damage-calculator earthquake-level earthquake-number hp) (giant-arrow-level-picker arrow-level)))))

;;;###autoload
(defun rocket-spear-level-picker (level)
  "Pick the good damage for the rocket spear LEVEL."
  (let ((levels '(350  350 420 420 420 490 490 490 560 560 560 630 630 630 700 700 700 770 770 770 840 840 840 910 910 910 980))) (elt levels (1- level))))

;;;###autoload
(defun rocket-hp-building-left (level hp)
  "Calculate rocket-spear damage by it's LEVEL and building HP."
  (interactive "nPress the level of the rocket spear: \nnPress the hp of the building: ")
  (print (format "The building has %d left" (- hp (rocket-spear-level-picker level)))))

;;;###autoload
(defun lightning-level-picker (level)
  "Pick the good percentage for the lightning LEVEL."
  (let ((levels '(150 180 210 240 270 320 400 480 560 600 640)))
    (elt levels (1- level))))

;;;###autoload
(defun lightning-damage-calculator (level number)
  "Calculate lightning damage depending of NUMBER LEVEL."
  (let* ((i 2)
	 (damage (lightning-level-picker level))
	 (total damage))
    (while (<= i number)
      (setq total (+ total damage))
      (setq i (1+ i)))
    total))

;;;###autoload
(defun lightning-hp-building-left (level hp)
  "Calculate lightning damage by it's LEVEL and building HP."
  (interactive "nPress the level of the lightning: \nnPress the hp of the building: ")
  (print (format "The building has %d hp left" (- hp (lightning-level-picker level)))))

;;;###autoload
(defun giant-arrow-level-picker (level)
  "Pick the good percentage for the lightning LEVEL."
  (let ((levels '(750 750 850 850 850 1000 1000 1000 1200 1200 1200 1500 1500 1500 1750 1750 1750 1950)))
    (elt levels (1- level))))

;;;###autoload
(defun giant-arrow-hp-building-left (level hp)
  "Calculate giant-arrow-spear damage by it's LEVEL and building HP."
  (interactive "nPress the level of the giant arrow: \nnPress the hp of the building: ")
  (print (format "The building has %d hp left" (- hp (giant-arrow-level-picker level)))))

;;;###autoload
(defun spicky-ball-level-picker (level)
  "Pick the good percentage for the lightning LEVEL."
  (let ((levels '(1000 1000 1250 1250 1250 1500 1500 1500 1750 1750 1750 2000 2000 2000 2250 2250 2250 2500 2500 2500 2750 2750 2750 3000 3000 3000 3250)))
    (elt levels (1- level))))

;;;###autoload
(defun spicky-ball-hp-building-left (level hp)
  "Calculate spicky ball damage by it's LEVEL and building HP."
  (interactive "nPress the level of the spicky ball: \nnPress the hp of the building: ")
  (print (format "The building has %d hp left" (- hp (spicky-ball-level-picker level)))))

;;;###autoload
(defun custom-hp-building-left (custom-setup)
  )

(defun parse-and-check-string (input-string)
  "Parse the string and check for specific characters."
  (let ((string-length (length input-string)))
    (dotimes (i string-length)
      (let ((char (aref input-string i)))
        (cond
         ((eq char ?f) (print (format "Found 'f' at index %d" i)))
         ((eq char ?a) (print (format "Found 'a' at index %d" i)))
         ((eq char ?s) (print (format "Found 's' at index %d" i)))
         ((eq char ?b) (print (format "Found 'b' at index %d" i)))
         ((eq char ?e) (print (format "Found 'e' at index %d" i)))
         ((eq char ?l) (print (format "Found 'l' at index %d" i)))
         (t (message "Other character '%c' at index %d" char i)))))))

(parse-and-check-string "eellfa")

(defface hydra-title-face
  '((t (:foreground "#FFA500" :weight bold :height 1.2)))
  "Face for hydra titles.")

(defface hydra-command-face
  '((t (:foreground "#87CEEB")))
  "Face for hydra commands.")

;; Apply these faces
(defhydra hydra-cool-menu (:color teal :hint nil)
  "
                            ██████╗ ██████╗  ██████╗    ██████╗        ██████╗
                           ██╔════╝██╔═══██╗██╔════╝    ██╔══██╗      ██╔════╝
                           ██║     ██║   ██║██║         ██║  ██║█████╗██║
                           ██║     ██║   ██║██║         ██║  ██║╚════╝██║
                           ╚██████╗╚██████╔╝╚██████╗    ██████╔╝      ╚██████╗
                            ╚═════╝ ╚═════╝  ╚═════╝    ╚═════╝        ╚═════╝
^^^
^Equipements^      ^Spells^         ^Combined^
^^^^^^^^-------------------------------------------------------
_h_: ^^^^Fireball      _b_: ^^^^Earthquake  _w_: ^^^^Fireball and Earthquake
_j_: ^^^^Giant arrow   _k_: ^^^^Lightning   _d_: ^^^^Fireball Earthquake Giant arrow
_k_: ^^^^Rocket spear                 _c_: ^^^^Fireball And Giant arrow
_l_: ^^^^Spicky ball
"
  ;; Equipements
  ("h" fireball-hp-building-left :face hydra-command-face)
  ("j" giant-arrow-hp-building-left :face hydra-command-face)
  ("l" spicky-ball-hp-building-left :face hydra-command-face)

  ;; Spells
  ("b" earthquake-hp-building-left :face hydra-command-face)
  ("k" lightning-hp-building-left :face hydra-command-face)

  ;; Combined
  ("w" fireball-and-earthquake-calculator :face hydra-command-face)
  ("d" fireball-earthquake-arrow-calculator :face hydra-command-face)
  ("c" fireball-and-arrow-calculator :face hydra-command-face)

  ;; Quit
  ("q" nil "quit" :color blue :face hydra-command-face))

(provide 'coc-damage-calculator)
;;; coc-damage-calculator.el ends here
