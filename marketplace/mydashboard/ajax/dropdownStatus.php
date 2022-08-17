<?php
/*
 -------------------------------------------------------------------------
 MyDashboard plugin for GLPI
 Copyright (C) 2015-2022 by the MyDashboard Development Team.
 -------------------------------------------------------------------------

 LICENSE

 This file is part of MyDashboard.

 MyDashboard is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 MyDashboard is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with MyDashboard. If not, see <http://www.gnu.org/licenses/>.
 --------------------------------------------------------------------------
 */

if (strpos($_SERVER['PHP_SELF'], "dropdownStatus.php")) {
   include("../../../inc/includes.php");
   header("Content-Type: text/html; charset=UTF-8");
   Html::header_nocache();
}

Session::checkCentralAccess();

// Make a select box
if (isset($_POST["itemtype"])) {
   $dbu       = new DbUtils();
   $state     = new State();
   $states     = [];
   $field = 'is_visible_'.strtolower($_POST["itemtype"]);
   $condition = [$field => 1]
                + $dbu->getEntitiesRestrictCriteria('glpi_states', 'entities_id', $_SESSION['glpiactive_entity'], true);
   $allstates = $state->find($condition);
   foreach ($allstates as $k => $v) {
      $states[$v['id']] = $v['name'];
   }
   Dropdown::showFromArray('states', $states, ['multiple' => true]);
}
