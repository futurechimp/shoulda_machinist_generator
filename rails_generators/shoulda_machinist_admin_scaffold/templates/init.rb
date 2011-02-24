require File.join(RAILS_ROOT, "vendor/plugins/minuet_core/lib/minuet_core")

# Add the permissions for this Minuet Engine into MinuetCore's permissions arrays
#MinuetCore.all_minuet_permissions << <%= controller_class_name %>.permissions if defined? MinuetCore