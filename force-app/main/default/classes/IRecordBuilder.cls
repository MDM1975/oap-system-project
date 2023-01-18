public interface IRecordBuilder {
    /**
     * Add a field to the record.
     * @param name The name of the field.
     * @param value The value of the field.
     * @return The builder.
     */
    SObject build();
}