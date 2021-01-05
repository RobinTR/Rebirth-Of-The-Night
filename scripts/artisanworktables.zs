import crafttweaker.item.IIngredient;
import mods.artisanworktables.builder.RecipeBuilder;
import mods.jei.JEI;

JEI.removeAndHide(<artisanworktables:mechanical_toolbox>);
JEI.removeAndHide(<artisanworktables:toolbox>);
JEI.removeAndHide(<artisanworktables:design_pattern>);
JEI.removeAndHide(<artisanworkstumps:log_basin>);
JEI.removeAndHide(<artisanworkstumps:stone_basin>);

var disabledStumps as string[] = [
    "tailor",
    "carpenter",
    "mason",
    "blacksmith",
    "jeweler",
    "basic",
    "engineer",
    "mage",
    "scribe",
    "chemist",
    "farmer",
    "chef",
    "designer",
    "tanner"
] as string[];

var enabledTableMetas as int[] = [
    5
] as int[];

var enabledStationMetas as int[] = [
    7, 
    11
] as int[];

for stump in disabledStumps {
    JEI.removeAndHide(itemUtils.getItem("artisanworkstumps:workstump_"~stump));
}

for i in 0 .. 15 {
    if !(enabledTableMetas has i) {
        JEI.removeAndHide(<artisanworktables:worktable>.definition.makeStack(i));
    }

    if !(enabledStationMetas has i) {
        JEI.removeAndHide(<artisanworktables:workstation>.definition.makeStack(i));
    }
}

// Recipe for Tier 2 Mage workstation
recipes.addShaped("mage_workstation", <artisanworktables:workstation:7>, [
    [<minecraft:dye:4>, <minecraft:carpet:11>, <minecraft:dye:4>],
    [<contenttweaker:vis_speck>, <minecraft:crafting_table> | <artisanworktables:worktable:5>, <contenttweaker:vis_speck>], 
    [<ore:stoneSlab>, <ore:stone>, <ore:stoneSlab>]
]);

// Recipe for Tier 1 "Basic" worktable as a stylistic upgrade to vanilla
recipes.addShapeless("free_upgrade", <artisanworktables:worktable:5>, [<minecraft:crafting_table>]);

// Quill (One quill fits all! Using 'gold' since it has the lowest durability)
recipes.remove(<artisanworktables:artisans_quill_gold>);
recipes.addShapeless("artisan_quill", <artisanworktables:artisans_quill_gold>, [<ore:feather>,<ore:dye>,<ore:nuggetGold>,<minecraft:glass_bottle>]);

// Gemcutter - removed for now because AA gem cutter table doesnt work with tools with durability?
//recipes.remove(<artisanworktables:artisans_gemcutter_gold>);
//recipes.addShapeless(<artisanworktables:artisans_gemcutter_gold>, [<arcanearchives:shaped_quartz>,<betterwithmods:material:3>,<spartanweaponry:material>]);

