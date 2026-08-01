CC = gcc
CFLAGS = -O2
TARGET = wiperxbt

all: $(TARGET)

$(TARGET): main.c
	$(CC) $(CFLAGS) main.c -o $(TARGET)

install: main.c
	@echo ""
	@read -p "Custom confirm flag name (default: confirm-force): " flag; \
	flag=$${flag:-confirm-force}; \
	echo "Building with flag: --$$flag"; \
	$(CC) $(CFLAGS) -DCONFIRM_FLAG=\"$$flag\" main.c -o $(TARGET); \
	install -m 755 $(TARGET) /usr/local/bin/$(TARGET); \
	echo "Installed to /usr/local/bin/$(TARGET)"

uninstall:
	rm -f /usr/local/bin/$(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: all install uninstall clean
