# In some situations it is desirable to keep serving requests from disk or the database if Redis crashes. This can be achieved with connection fault tolerance by enabling it at the top leve
# The default value is false, because while it may work for fetch operations, it isn't compatible with other state-based commands like increment
Readthis.fault_tolerant = true